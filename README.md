# Today I Learned

My Today I Learned snippets. Inspired by [simonw/til](https://github.com/simonw/til).

Search these TILs at https://til.alexwlchan.net/

<!-- [[[cog
import frontmatter
import datetime
import os
import re

import cog

for d in sorted(os.listdir(".")):
    if not os.path.isdir(d) or d.startswith("."):
        continue

    cog.outl(f"\n## {d}\n")

    entries = []

    for f in os.listdir(d):
        if not f.endswith(".md"):
            continue

        fm = frontmatter.load(os.path.join(d, f))

        entries.append((f, fm))

    for f, fm in sorted(entries, key=lambda e: e[1]['date'], reverse=True):
        date = datetime.datetime.fromisoformat(fm['date'].split()[0]).strftime('%-d %B %Y')

        title = f.replace(".md", "")

        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{f}">{title}</a> – {date}')
]]]-->

## live-text

- <a href="https://github.com/alexwlchan/til/blob/main/live-text/Live Text is aware of how hyphenation works.md">Live Text is aware of how hyphenation works</a> – 26 December 2023

## photokit

- <a href="https://github.com/alexwlchan/til/blob/main/photokit/How to delete albums.md">How to delete albums</a> – 27 December 2023

## python

- <a href="https://github.com/alexwlchan/til/blob/main/python/Run a randomly selected subset of tests with pytest.md">Run a randomly selected subset of tests with pytest</a> – 3 January 2024

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Getting a tally of SQLite values as a CSV.md">Getting a tally of SQLite values as a CSV</a> – 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using sqlite-utils to convert a CSV into a SQLite database.md">Using sqlite-utils to convert a CSV into a SQLite database</a> – 2 January 2024
<!-- [[[end]]] (checksum: c704aafaec27f21e7f97a64ec59a4b71) -->
