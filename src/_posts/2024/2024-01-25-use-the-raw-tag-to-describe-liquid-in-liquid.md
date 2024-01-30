---
layout: post
title: Use the `{% raw %}` tag to describe Liquid in Liquid
date: 2024-01-25 21:55:11 +0000
tags:
  - liquid
  - jekyll
---
This is a problem I had when trying to write my TIL about [the `{% raw %}{% capture %}{% endraw %}` tag]({% post_url 2024/2024-01-12-use-the-capture-tag-for-complex-strings %}).
I'd written an example in my Markdown source code:

<pre><code>You can use the [capture tag] to create a new variable:

```liquid
{% raw %}{% capture variable %}
  value
{% endcapture %}{% endraw %}
```</code></pre>

but the rendered `<pre>` block was empty -- Liquid ran before the Markdown processor, so it had captured the variable and left empty space.

I found [an answer by Marcel Jackwerth](https://stackoverflow.com/a/7585479/1558022) on Stack Overflow that suggests using the `{&percnt; raw &percnt;}` tag, which in this case became:

<pre><code>You can use the [capture tag] to create a new variable:

```liquid
{&percnt; raw &percnt;}{% capture variable %}
  value
{% endcapture %}{&percnt; endraw &percnt;}{% endraw %}
```</code></pre>