---
date: 2023-10-16 16:45:35 +0000
---
You can do structured data queries using [Special:MediaSearch](https://www.mediawiki.org/wiki/Help:MediaSearch#Statements_and_structured_data).
Here are a couple of examples:

*   To find uses of a particular statement:

    *   Videos with property P1651 (YouTube video ID): <https://commons.wikimedia.org/wiki/Special:MediaSearch?type=video&search=haswbstatement%3AP1651>
    *   Images with property P12120 (Flickr photo ID): <https://commons.wikimedia.org/wiki/Special:MediaSearch?type=image&search=haswbstatement%3AP12120>

*   To find a statement with a particular value:

    *   Images with P7482=Q66458942 (source of file is original creation by uploader): <https://commons.wikimedia.org/wiki/Special:MediaSearch?search=haswbstatement%3AP7482%3DQ66458942&type=image>

You can also do this with the Commons Query Service, but I haven't tried that in a while so I don't have notes on how that works.
