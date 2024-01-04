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
    cog.outl(f"\n## {d}\n")

    entries = []

    for f in os.listdir(d):
        if not f.endswith(".md"):
            continue

        fm = frontmatter.load(os.path.join(d, f))

        entries.append((f, fm))

    for f, fm in sorted(entries, key=lambda e: e[1]['date'], reverse=True):
        date = datetime.datetime.fromisoformat(fm['date'].split()[0]).strftime('%-d %B %Y')

        title = html.escape(f.replace(".md", ""))

        # Note: I use HTML instead of Markdown for this link because
        # Marked 2 (which I use for local Markdown previews) gets confused
        # by spaces in the URL portion of Markdown links.
        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{urlquote(f)}">{title}</a> – {date}')
]]]-->
13 TILs to date.

## applescript

- <a href="https://github.com/alexwlchan/til/blob/main/applescript/Get%20the%20contents%20of%20a%20page%20with%20%22do%20JavaScript%22.md">Get the contents of a page with &quot;do JavaScript&quot;</a> – 4 January 2024

## github

- <a href="https://github.com/alexwlchan/til/blob/main/github/SVGs%20are%20only%20rendered%20on%20GitHub%20if%20you%20use%20an%20%3Cimg%3E%20that%20points%20to%20another%20file.md">SVGs are only rendered on GitHub if you use an &lt;img&gt; that points to another file</a> – 4 January 2024

## javascript

- <a href="https://github.com/alexwlchan/til/blob/main/javascript/Use%20Unicode%20property%20escapes%20to%20detect%20emoji.md">Use Unicode property escapes to detect emoji</a> – 6 September 2023

## live-text

- <a href="https://github.com/alexwlchan/til/blob/main/live-text/Live%20Text%20is%20aware%20of%20how%20hyphenation%20works.md">Live Text is aware of how hyphenation works</a> – 26 December 2023

## photokit

- <a href="https://github.com/alexwlchan/til/blob/main/photokit/How%20to%20delete%20albums.md">How to delete albums</a> – 27 December 2023

## python

- <a href="https://github.com/alexwlchan/til/blob/main/python/Use%20the%20regex%20library%20to%20get%20Unicode%20property%20escapes.md">Use the regex library to get Unicode property escapes</a> – 4 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/Run%20a%20randomly%20selected%20subset%20of%20tests%20with%20pytest.md">Run a randomly selected subset of tests with pytest</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/The%20sqlite3%20context%20manager%20doesn%E2%80%99t%20close%20connections.md">The sqlite3 context manager doesn’t close connections</a> – 2 January 2024

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Getting%20a%20tally%20of%20SQLite%20values%20as%20a%20CSV.md">Getting a tally of SQLite values as a CSV</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using%20sqlite-utils%20to%20convert%20a%20CSV%20into%20a%20SQLite%20database.md">Using sqlite-utils to convert a CSV into a SQLite database</a> – 2 January 2024

## svg

- <a href="https://github.com/alexwlchan/til/blob/main/svg/Animate%20an%20attribute%20of%20an%20element%20with%20%3Canimate%3E.md">Animate an attribute of an element with &lt;animate&gt;</a> – 4 January 2024

## youtube

- <a href="https://github.com/alexwlchan/til/blob/main/youtube/Modifying%20Liked%20videos%20with%20the%20Python%20API.md">Modifying Liked videos with the Python API</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/youtube/Get%20a%20list%20of%20Liked%20videos.md">Get a list of Liked videos</a> – 3 January 2024
<!-- [[[end]]] (checksum: 59897a64fd41b852d8e18e50b3c0f127) -->
