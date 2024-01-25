---
layout: page
title: ""
---

<ul>
{% for p in site.posts %}
<li>
  <a href="{{ p.url }}">{{ p.title }}</a><br/>
  {{ p.tags }} / {{ p.date }}
</li>
{% endfor %}
</ul>