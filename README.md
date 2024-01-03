# Today I Learned

My Today I Learned snippets. Inspired by [simonw/til](https://github.com/simonw/til).

Search these TILs at https://til.alexwlchan.net/

<!-- [[[cog
import frontmatter
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
        date = fm['date'].split()[0]
        assert re.match(r'^[0-9]{4}-[0-9]{2}-[0-9]{2}$', date), f

        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{f}">{f}</a> - {date}')
]]]-->

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Getting a tally of SQLite values as a CSV.md">Getting a tally of SQLite values as a CSV.md</a> - 2024-01-03
- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using sqlite-utils to convert a CSV into a SQLite database.md">Using sqlite-utils to convert a CSV into a SQLite database.md</a> - 2024-01-02
<!-- [[[end]]] (checksum: 0740242c3e1ce97be6169e042ed746af) -->
