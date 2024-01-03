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
