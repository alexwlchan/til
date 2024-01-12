---
date: 2024-01-12 21:35:45 +0000
---
You can use the [capture tag] to create a new variable:

```liquid
{% capture variable %}
  value
{% endcapture %}
```

This could be quite useful for building up complex variables with several conditionals or loops, inside the template.

I first saw this variable being used in [an article by Jesse Squires][squires], and although I don't have a use for it right now, it's a useful one to remember.

[capture tag]: https://shopify.dev/docs/api/liquid/tags/capture
[squires]: https://www.jessesquires.com/blog/2021/06/06/rss-feeds-jekyll-and-absolute-versus-relative-urls/
