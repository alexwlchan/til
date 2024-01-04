---
date: 2024-01-03 19:19:09 +0000
---
Here's a quick utility function I wrote which can tell you if you've liked a video:

```python
def is_video_liked(youtube, *, video_id):
    """
    Returns True if you've liked the current video, False otherwise.
    """
    request = youtube.videos().getRating(id=video_id)
    response = request.execute()

    # The response will be a dict of the form
    #
    #       {
    #         'etag': '1q4qm5WbpGIqw0WISfNsTRQRCXU',
    #         'items': [
    #           {
    #             'rating': 'none' | 'like' | 'dislike',
    #             'videoId': 'R8pLzhjJY1s'
    #           }
    #         ],
    #         'kind': 'youtube#videoGetRatingResponse'
    #       }
    #
    return response["items"][0]["rating"] == "like"
```

Notice that YouTube can return three statuses for rating: `none`, `like`, and `dislike`.
Because I never use the "dislike" button, on all the videos I watch the status will only be `none` or `like`.

I also wrote two functions for liking and unliking a video:

```python
def like_video(youtube, *, video_id):
    """
    Mark a video as "liked" on YouTube.
    """
    request = youtube.videos().rate(id=video_id, rating="like")
    response = request.execute()


def unlike_video(youtube, *, video_id):
    """
    Remove the "liked" rating from a video on YouTube.
    """
    request = youtube.videos().rate(id=video_id, rating="none")
    response = request.execute()
```

I was able to combine these two functions to migrate a list of Liked videos from one account to the other:

```python
for video in reversed(list(get_liked_videos(old_youtube)):
    print('https://www.youtube.com/watch?v=' + video['id'])

    like_video(new_youtube, video_id=video['id'])
    unlike_video(old_youtube, video_id=video['id'])

    time.sleep(1)
```

Note that I reversed the list because I wanted to preserve the rough order, and `get_liked_videos()` returns the most recently liked video first.

I got a couple of HTTP 403 errors:

*   "The owner of the video that you are trying to rate has disabled ratings for that video." – but I was able to like/unlike the video in my web browser, so I'm not sure what was happening here.

*   "The request cannot be completed because you have exceeded your <a href="/youtube/v3/getting-started#quota">quota</a>." – this was a rate limit on the "getting the list of likes", and I'd used a bunch of my quota while testing.
    
    I found the quotas under the "IAM and admin" panel of the Google Cloud console (after following a link from [Quota and Compliance Audits](https://developers.google.com/youtube/v3/guides/quota_and_compliance_audits)), where I could see that I'd used up my daily quota – I'll just continue the script tomorrow.
    
    You get 10,000 units per day, and [this table of quota costs][costs] says rating a video costs "50 units" – so I can use this method to migrate about ~100 videos a day.
    
    I can't this in Google's documentation, but various sites on the web e.g. Stack Overflow answers say that the quota resets at midnight Pacific Time (or ~8am in London).
    
[costs]: https://developers.google.com/youtube/v3/determine_quota_cost
