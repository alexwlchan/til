---
date: 2024-01-04 22:59:15 +0000
---
Here's an AppleScript which runs `document.querySelector` in a Safari tab and returns the relevant HTML:

```applescript
tell application "Safari"
	tell document 1
		set selectedText to (do JavaScript "document.querySelector(\"main\").innerHTML")
		get selectedText
	end tell
end tell
```

Note that you have to add that `.innerHTML` attribute -- it doesn't work without it.

If you try to run the AppleScript without it, e.g.

```applescript
set selectedText to (do JavaScript "document.querySelector(\"main\")")
```

You get an error further down in the script:

```
The variable selectedText is not defined.
```

I suspect this is because `document.querySelector` returns some sort of DOM object which AppleScript doesn't know how to store in a variable, whereas `.innerHTML` returns a string that it can store quite happily.
