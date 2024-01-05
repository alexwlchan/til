---
date: 2024-01-04 22:59:15 +0000
---
Here's an AppleScript which runs `document.querySelector` in a Safari tab and returns the matching HTML:

```applescript
tell application "Safari"
  tell document 1
    set selectedText to (do JavaScript "document.querySelector(\"main\").innerHTML")
    get selectedText
 end tell
end tell
```

## You need that `.innerHTML` property

If you try to run the AppleScript without the `.innerHTML` property, e.g.

```applescript
set selectedText to (do JavaScript "document.querySelector(\"main\")")
```

You get an error further down in the script:

```
The variable selectedText is not defined.
```

I suspect this is because `document.querySelector` returns some sort of DOM object which AppleScript doesn't know how to store in a variable, whereas `.innerHTML` returns a string that it can store quite happily.

## Why do I want to do this?

I wanted a way to programatically get the contents of tweets I had open in my browser.

*   I used to use the Twitter API, but there's no (reasonably priced) read API for me to use.
*   Because Twitter relies so heavily on JavaScript, fetching the page separately (e.g. `curl https://twitter.com/…`) doesn't actually get the contents of the tweet – it just gets an error page, or a page with the JS that will eventually load the tweet.
*   Similarly, this breaks the `get source` action in AppleScript (`tell application "Safari" to get source of document 1`) – the HTML it returns doesn't contain the contents of the tweet.

But the rendered HTML is available to JavaScript running on the page, so we can exfilitrate it this way.,
