---
layout: page
title: ""
---

### Tags

{% assign sorted_tags = site.data["tag_tally"] | sort %}

<ul class="dot_list">
  {% for t in sorted_tags %}
  <li>
    <a href="#{{ t[0] }}" class="novisited">{{ t[0] }}</a>&nbsp;({{ t[1] | size }})
  </li>
  {% endfor %}
</ul>

---

{% for t in sorted_tags %}
{% assign tag_name = t[0] %}
{% assign tagged_posts = t[1] %}

<h3 id="{{ tag_name }}">{{ tag_name }}</h3>

<ul>
{% for p in tagged_posts %}
  <li><a href="{{ p.url }}">{{ p.title }}</a> ({{ p.date | date: "%-d %B %Y" }})</li>
{% endfor %}
</ul>

{% endfor %}
