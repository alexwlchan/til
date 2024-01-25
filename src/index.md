---
layout: page
title: ""
---

<style>
  footer {
    margin-top: 100vh;
  }
</style>

TIL = Today I Learned.

You can think of this site as a sort of <a href="https://winterflower.github.io/2017/08/17/software-engineering-notebook/">“digital lab notebook”</a> – a collection of things I’ve learnt while doing software development and browsing the Internet that I thought were worth remembering.

{% assign sorted_tags = site.data["tag_tally"] | sort %}

<p style="display: inline;">Browse by tag:</p>
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
