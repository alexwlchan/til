# Today I Learned

My Today I Learned snippets. Inspired by [simonw/til](https://github.com/simonw/til).

<!-- Search these TILs at https://til.alexwlchan.net/ -->

<!-- [[[cog
import frontmatter
import datetime
import html
import os
import re

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
        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{f}">{title}</a> – {date}')
]]]-->
10 TILs to date.

## github

- <a href="https://github.com/alexwlchan/til/blob/main/github/SVGs are only rendered on GitHub if you use an <img> that points to another file.md">SVGs are only rendered on GitHub if you use an &lt;img&gt; that points to another file</a> – 4 January 2024

## live-text

- <a href="https://github.com/alexwlchan/til/blob/main/live-text/Live Text is aware of how hyphenation works.md">Live Text is aware of how hyphenation works</a> – 26 December 2023

## photokit

- <a href="https://github.com/alexwlchan/til/blob/main/photokit/How to delete albums.md">How to delete albums</a> – 27 December 2023

## python

- <a href="https://github.com/alexwlchan/til/blob/main/python/Run a randomly selected subset of tests with pytest.md">Run a randomly selected subset of tests with pytest</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/python/The sqlite3 context manager doesn’t close connections.md">The sqlite3 context manager doesn’t close connections</a> – 2 January 2024

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Getting a tally of SQLite values as a CSV.md">Getting a tally of SQLite values as a CSV</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using sqlite-utils to convert a CSV into a SQLite database.md">Using sqlite-utils to convert a CSV into a SQLite database</a> – 2 January 2024

## svg

- <a href="https://github.com/alexwlchan/til/blob/main/svg/Animate an attribute of an element with <animate>.md">Animate an attribute of an element with &lt;animate&gt;</a> – 4 January 2024

## youtube

- <a href="https://github.com/alexwlchan/til/blob/main/youtube/Modifying Liked videos with the Python API.md">Modifying Liked videos with the Python API</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/youtube/Get a list of Liked videos.md">Get a list of Liked videos</a> – 3 January 2024
<!-- [[[end]]] (checksum: 27116cd72b63f4b4e936acf918b73b08) -->
