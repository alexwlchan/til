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

    for f in os.listdir(d):
        if not f.endswith(".md"):
            continue

        fm = frontmatter.load(os.path.join(d, f))
        date = fm['date'].split()[0]
        assert re.match(r'^[0-9]{4}-[0-9]{2}-[0-9]{2}$', date), f

        cog.outl(f'- <a href="https://github.com/alexwlchan/til/blob/main/{d}/{f}">{f}</a> - {date}')
  

]]]-->

## sqlite

- <a href="https://github.com/alexwlchan/til/blob/main/sqlite/Using sqlite-utils to convert a CSV into a SQLite database.md">Using sqlite-utils to convert a CSV into a SQLite database.md</a> - 2024-01-02
<!-- [[[end]]] (checksum: 82bf72399bda9a2d6cf0d8357e9d6e02) -->
