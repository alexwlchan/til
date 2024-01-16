# Today I Learned

My Today I Learned snippets. Inspired by [simonw/til](https://github.com/simonw/til).

<!-- Search these TILs at https://til.alexwlchan.net/ -->

<!-- [[[cog
import frontmatter
import datetime
import html
import os
import re
from urllib.parse import quote as urlquote

import cog

subdir_names = [
    d
    for d in sorted(os.listdir("."))
    if os.path.isdir(d) and not d.startswith(".")
]

total_entries = 0

for i, dirname in enumerate(subdir_names, start=1):
    entries = len([f for f in os.listdir(dirname) if f.endswith(".md")])
    total_entries += entries

# When this list gets long enough, this will enable me to create
# an index of topic names.
#     cog.out(f'<a href="#{dirname}">{dirname}</a> ({entries})')
#
#     if i != len(subdir_names):
#         cog.out(" / ")
#     else:
#         cog.outl("")

cog.outl(f"{total_entries} TILs to date.")

for d in subdir_names:
    entries = []

    for f in os.listdir(d):
        if not f.endswith(".md"):
            continue

        fm = frontmatter.load(os.path.join(d, f))

        entries.append((f, fm))

    if not entries:
        continue

    cog.outl(f"\n## {d}\n")

    for f, fm in sorted(entries, key=lambda e: e[1]['date'], reverse=True):
        date = datetime.datetime.fromisoformat(fm['date'].split()[0]).strftime('%-d %B %Y')

        title = html.escape(f.replace(".md", ""))

        # Note: I use HTML instead of Markdown for this link because
        # Marked 2 (which I use for local Markdown previews) gets confused
        # by spaces in the URL portion of Markdown links.
        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{urlquote(f)}">{title}</a> – {date}')
]]]-->
33 TILs to date.

## applescript

- <a href="https://github.com/alexwlchan/til/blob/main/applescript/Get%20the%20contents%20of%20a%20page%20in%20Safari%20with%20%22do%20JavaScript%22.md">Get the contents of a page in Safari with &quot;do JavaScript&quot;</a> – 4 January 2024

## bash

- <a href="https://github.com/alexwlchan/til/blob/main/bash/Create%20a%20directory%20before%20you%20%60cp%60%20or%20%60mv%60%20a%20file%20to%20it.md">Create a directory before you `cp` or `mv` a file to it</a> – 7 January 2024

## css

- <a href="https://github.com/alexwlchan/til/blob/main/css/How%20to%20create%20a%20footer%20that%E2%80%99s%20always%20at%20the%20bottom%20of%20the%20page.md">How to create a footer that’s always at the bottom of the page</a> – 12 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/css/How%20to%20style%20a%20%3Cdetails%3E%20element%20differently%20depending%20on%20whether%20it%E2%80%99s%20open%20or%20closed.md">How to style a &lt;details&gt; element differently depending on whether it’s open or closed</a> – 7 January 2024

## curl

- <a href="https://github.com/alexwlchan/til/blob/main/curl/How%20to%20do%20resumable%20downloads.md">How to do resumable downloads</a> – 17 October 2023

## flickr

- <a href="https://github.com/alexwlchan/til/blob/main/flickr/The%20acronym%20%22woe%22%20in%20the%20Flickr%20API%20stands%20for%20%22Where%20On%20Earth%22.md">The acronym &quot;woe&quot; in the Flickr API stands for &quot;Where On Earth&quot;</a> – 2 October 2023

## github

- <a href="https://github.com/alexwlchan/til/blob/main/github/Run%20the%20Netlify%20CLI%20in%20GitHub%20Actions.md">Run the Netlify CLI in GitHub Actions</a> – 6 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/github/SVGs%20are%20only%20rendered%20on%20GitHub%20if%20you%20use%20an%20%3Cimg%3E%20that%20points%20to%20another%20file.md">SVGs are only rendered on GitHub if you use an &lt;img&gt; that points to another file</a> – 4 January 2024

## javascript

- <a href="https://github.com/alexwlchan/til/blob/main/javascript/Sort%20a%20list%20of%20DOM%20elements%20by%20sorting%20and%20calling%20appendChild%28%29.md">Sort a list of DOM elements by sorting and calling appendChild()</a> – 11 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/javascript/Use%20Unicode%20property%20escapes%20to%20detect%20emoji.md">Use Unicode property escapes to detect emoji</a> – 6 September 2023

## liquid

- <a href="https://github.com/alexwlchan/til/blob/main/liquid/Use%20the%20%7B%25%20capture%20%25%7D%20tag%20to%20assign%20complex%20strings%20to%20variables.md">Use the {% capture %} tag to assign complex strings to variables</a> – 12 January 2024

## live-text

- <a href="https://github.com/alexwlchan/til/blob/main/live-text/Live%20Text%20is%20aware%20of%20how%20hyphenation%20works.md">Live Text is aware of how hyphenation works</a> – 26 December 2023

## nginx

- <a href="https://github.com/alexwlchan/til/blob/main/nginx/Use%20shlex.split%28%29%20to%20parse%20log%20files%20quickly.md">Use shlex.split() to parse log files quickly</a> – 5 January 2024

## photokit

- <a href="https://github.com/alexwlchan/til/blob/main/photokit/How%20to%20delete%20albums.md">How to delete albums</a> – 27 December 2023

## python

- <a href="https://github.com/alexwlchan/til/blob/main/python/How%20to%20gracefully%20restart%20a%20gunicorn%20app.md">How to gracefully restart a gunicorn app</a> – 16 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/How%20to%20find%20the%20longest%20common%20suffix%20in%20a%20list%20of%20strings.md">How to find the longest common suffix in a list of strings</a> – 14 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/How%20to%20simulate%20shell%20pipes%20with%20the%20subprocess%20module.md">How to simulate shell pipes with the subprocess module</a> – 13 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/Manage%20MP3%20metadata%20from%20iTunes%20with%20eyed3.md">Manage MP3 metadata from iTunes with eyed3</a> – 12 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/Create%20flag%20emojis%20for%20countries.md">Create flag emojis for countries</a> – 10 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/Use%20the%20regex%20library%20to%20get%20Unicode%20property%20escapes.md">Use the regex library to get Unicode property escapes</a> – 4 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/Run%20a%20randomly%20selected%20subset%20of%20tests%20with%20pytest.md">Run a randomly selected subset of tests with pytest</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/The%20sqlite3%20context%20manager%20doesn%E2%80%99t%20close%20connections.md">The sqlite3 context manager doesn’t close connections</a> – 2 January 2024

## spreadsheets

- <a href="https://github.com/alexwlchan/til/blob/main/spreadsheets/Use%20the%20IMAGE%20function%20to%20insert%20an%20image%20into%20a%20spreadsheet.md">Use the IMAGE function to insert an image into a spreadsheet</a> – 9 January 2024

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Getting%20a%20tally%20of%20SQLite%20values%20as%20a%20CSV.md">Getting a tally of SQLite values as a CSV</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using%20sqlite-utils%20to%20convert%20a%20CSV%20into%20a%20SQLite%20database.md">Using sqlite-utils to convert a CSV into a SQLite database</a> – 2 January 2024

## svg

- <a href="https://github.com/alexwlchan/til/blob/main/svg/Pausing%20the%20animation%20of%20%3Csvg%3E%20elements%20can%20affect%20child%20%3Csvg%3E%20elements%20differently%20in%20different%20browsers.md">Pausing the animation of &lt;svg&gt; elements can affect child &lt;svg&gt; elements differently in different browsers</a> – 7 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/svg/Animate%20an%20attribute%20of%20an%20element%20with%20%3Canimate%3E.md">Animate an attribute of an element with &lt;animate&gt;</a> – 4 January 2024

## swift

- <a href="https://github.com/alexwlchan/til/blob/main/swift/How%20to%20profile%20Swift%20code.md">How to profile Swift code</a> – 23 May 2023

## wikimedia-commons

- <a href="https://github.com/alexwlchan/til/blob/main/wikimedia-commons/Go%20between%20the%20M-IDs%20and%20filenames.md">Go between the M-IDs and filenames</a> – 8 December 2023
- <a href="https://github.com/alexwlchan/til/blob/main/wikimedia-commons/How%20to%20find%20files%20that%20use%20a%20particular%20SDC%20field.md">How to find files that use a particular SDC field</a> – 16 October 2023
- <a href="https://github.com/alexwlchan/til/blob/main/wikimedia-commons/Why%20the%20term%20%22snak%22%20keeps%20appearing%20in%20the%20API.md">Why the term &quot;snak&quot; keeps appearing in the API</a> – 10 October 2023

## youtube

- <a href="https://github.com/alexwlchan/til/blob/main/youtube/Modifying%20Liked%20videos%20with%20the%20Python%20API.md">Modifying Liked videos with the Python API</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/youtube/Get%20a%20list%20of%20Liked%20videos.md">Get a list of Liked videos</a> – 3 January 2024
<!-- [[[end]]] (checksum: 37a275d099392e24f4992ca39d5de694) -->
