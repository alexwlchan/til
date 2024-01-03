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

        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{f}">{f}</a> - {date}')
]]]-->

## photokit

- <a href="https://github.com/alexwlchan/til/blob/main/photokit/How to delete albums.md">How to delete albums.md</a> - 3 January 2024

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Getting a tally of SQLite values as a CSV.md">Getting a tally of SQLite values as a CSV.md</a> - 3 January 2024
- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using sqlite-utils to convert a CSV into a SQLite database.md">Using sqlite-utils to convert a CSV into a SQLite database.md</a> - 2 January 2024
<!-- [[[end]]] (checksum: 797f00e07f181621653ef4d445088539) -->
