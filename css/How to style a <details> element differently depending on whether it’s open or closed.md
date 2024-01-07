---
date: 2024-01-07 22:46:43 +0000
---

If you want to style a `<details>` element which is open, use the `details[open]` selector ([MDN link](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details#customizing_the_appearance)):

```css
details[open] {
  background: green;
}
```

If you want to style a `<details>` element which is closed, there are two options:
  
1.  Apply a style with the `details` selector, and then undo it for the open state with the `details[open]` selector.

2.  Or if you want to make it clearer that this only applies to the closed element, you combine the [`:not()` pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/:not) and `open`:

    ```css
    details:not([open]) {
      background: red;
    }
    ```

    I got this by guessing, but it works in Safari and I found a few other examples of similar syntax on the web, so I'm pretty sure this is safe.
