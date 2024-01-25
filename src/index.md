---
layout: page
title: ""
---

This site is as a sort of <a href="https://winterflower.github.io/2017/08/17/software-engineering-notebook/">“digital lab notebook”</a> – a collection of things I’ve learnt while doing software development and browsing the Internet that I thought were worth remembering.

<!-- The term "TIL" stands for "Today I Learned". -->

<!-- There are {{ site.posts | size }} TILs so far. -->

You can <a href="/atom.xml">subscribe to the RSS feed</a> to get new TILs.

{% assign sorted_tags = site.data["tag_tally"] | sort %}

<p style="display: inline;">
  <strong>Browse by tag:</strong>
</p>
<ul class="dot_list" style="display: inline;">
  {% for t in sorted_tags %}
  <li>
    <a href="#{{ t[0] }}" class="novisited">{{ t[0] }}</a>&nbsp;({{ t[1] | size }})
  </li>
  {% endfor %}
</ul>

<img src="/notebook.png">

{% for t in sorted_tags %}
{% assign tag_name = t[0] %}
{% assign tagged_posts = t[1] %}

<h3 id="{{ tag_name }}">{{ tag_name }} <a href="#{{ tag_name }}" style="text-decoration: none;" class="novisited">#</a></h3>

<ul>
{% for p in tagged_posts %}
  <li><a href="{{ p.url }}">{{ p.title }}</a> ({{ p.date | date: "%-d %B %Y" }})</li>
{% endfor %}
</ul>

{% endfor %}

<!-- This number is eyeballed to ensure that the final item always
    has enough whitespace for the anchor link -->

<p style="margin-top: calc(100vh - 330px);">
  (This paragraph is just here to ensure there’s enough whitespace for the final anchor link to scroll to the right place.)
</p>
