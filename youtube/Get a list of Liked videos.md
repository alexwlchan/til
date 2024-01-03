---
date: 2024-01-03 18:50:51 +0000
---
*   I started by following the [Python quickstart guide][quickstart] for the YouTube API.
    That directs you to install three Python libraries; when I tried it, these are the versions I used:

    ```
    google-api-python-client==2.111.0
    google-auth-httplib2==0.2.0
    google-auth-oauthlib==1.2.0
    ```
    
    It also directs you to get some OAuth credentials from the Google Cloud Console; I found that part fine.

*   I tried to get some sample code from the documentation for the [Videos: list API][list_api], but when I ran it, I was getting an error on this line:

    ```python
    credentials = flow.run_console()
    ```
    
    I found a [Stack Overflow answer][pins] suggesting I should pin the version, but this was a mistake.
    Although this method now ran, it took me to authenticate in the browser where I got a different error:
    
    > **Error 400: invalid_request** <br/>
    > The out-of-band (OOB) flow has been blocked in order to keep users secure. Follow the Out-of-Band (OOB) flow migration guide linked in the developer docs below to migrate your app to an alternative method.

    and I found a [different Stack Overflow answer][server] that suggested I change this line to:
    
    ```python
    credentials = flow.run_local_server()
    ```
    
    and that got the flow working correctly.

*   This was the initial function I wrote to get an instance of the YouTube API that's authenticated with OAuth:

    ```python
    def create_youtube_client():
        api_service_name = "youtube"
        api_version = "v3"
        client_secrets_file = "client_secret_149689310375-97jtmrtvvle6rm2u4iarcsoduhffhlqv.apps.googleusercontent.com.json"
        scopes = ["https://www.googleapis.com/auth/youtube.readonly"]

        # Get credentials and create an API client
        flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
            client_secrets_file, scopes
        )
        credentials = flow.run_local_server()

        return googleapiclient.discovery.build(
            api_service_name, api_version, credentials=credentials
        )
    ```
    
    This sends you to the browser to approve the app and log into your YouTube account, which is mildly tedious.
    
    The `credentials` variable is an instance of [google.oauth2.credentials.Credentials], which you can serialise as JSON.
    It looks like a standard OAuth2 token.

    I modified the function to save a cached copy of the credentials to a JSON file, and reload them if found later:
    
    ```python
    def create_youtube_client():
        api_service_name = "youtube"
        api_version = "v3"
        client_secrets_file = "client_secret_149689310375-97jtmrtvvle6rm2u4iarcsoduhffhlqv.apps.googleusercontent.com.json"
        scopes = ["https://www.googleapis.com/auth/youtube.readonly"]

        try:
            with open("credentials.json") as in_file:
                data = json.load(in_file)
                credentials = google.oauth2.credentials.Credentials(**data)
        except FileNotFoundError:
            # Get credentials and create an API client
            flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
                client_secrets_file, scopes
            )
            credentials = flow.run_local_server()

            with open("credentials.json", "w") as out_file:
                out_file.write(credentials.to_json())

        return googleapiclient.discovery.build(
            api_service_name, api_version, credentials=credentials
        )
    ```
    
    This avoids having to log in every time.
    
    Saving it to a JSON file is obviously a security risk, but I reckon it's fine for my quick hacking.
    
    If I was doing this for real, I'd use keyring and save it in the system keychain.
    One thing I'd need here is a way to identify the logged-in user – I have several YouTube accounts.
    I couldn't see any identifying information (e.g. an email address) in the `credentials` variable, and I couldn't find a way to look up the user info from the credentials in a pinch.

*   Once I've got a client, I was able to write a generator function that pages through the list of likes:

    ```python
    def get_liked_videos(youtube):
        kwargs = {"part": "snippet", "myRating": "like", "maxResults": 50}

        while True:
            request = youtube.videos().list(**kwargs)
            response = request.execute()

            yield from response["items"]

            try:
                kwargs["pageToken"] = response["nextPageToken"]
            except KeyError:
                break


    if __name__ == "__main__":
        youtube = create_youtube_client()

        for video in get_liked_videos(youtube):
            print(video)
    ```
    
    You can get up to 50 results per page, even if you pass a higher value for `maxResults`.
    
    You pass the `nextPageToken` for pagination.
    On the final page, you get a non-empty list of `items`, but the `nextPageToken` parameter is missing.
    
    Each `video` is a large dict; I haven't dug into what the fields are – I'm only interested in the `id` right now.

[list_api]: https://developers.google.com/youtube/v3/docs/videos/list
[quickstart]: https://developers.google.com/youtube/v3/quickstart/python
[pins]: https://stackoverflow.com/a/75829631/1558022
[server]: https://stackoverflow.com/a/74834470/1558022
[google.oauth2.credentials.Credentials]: https://google-auth.readthedocs.io/en/stable/reference/google.oauth2.credentials.html
