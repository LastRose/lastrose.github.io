---
layout: post
title:  "CSS Variable"
permalink: css-variables/
date:   2021-08-09 7:14:00
author: Last Rose Studios
categories: Programming
tags: CSS
cover: "./assets/instacode.png"
---

## CSS Variables
These have been around for a few years and while they where interesting, lack of browser support haven't made them all that interesting. Between the lack of browser support and preprocessors having variables, we never really explored the power of CSS variables. 

With IE dropping out of the picture, and almost all modern browsers now supporting it, we gave them another look. The power it has, has changed the way we now use preprocessors. We now prefer the use of the css variable over a preprocessor variable.

In case you haven't seen css variables here is what it looks like
```css
:root {
  --background: #ffffff;
  --color: #000000;
}
.dark {
  --background: #000000;
  --color: #ffffff;
}

.btn-default {
  color: var(--background);
  background: var(--color);
}

div {
  color: var(--color);
  background-color: var(--background);
  padding: 2rem;
}
p {
  max-width: 76ch;
  margin-inline: auto;
  padding-inline: 2rem;
}
```

## Why is it so powerful?
CSS variables can help reduce the amount of code you write, and really embraces the cascade. Rather then redefining elements, you can simply redefine the variables. You can use them to make sure that your users adhere to brand/contrast guidelines.

Take the example above. if you have the following html
```html
<div>
  <p>This is some content</p>
  <p><button class="btn-default">Button</button></p>
</div>
<div class="dark">
  <p>This is some content on a dark background</p>
  <p><button class="btn-default">Button</button></p>
</div>
```
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/zay0hu37/embedded/result/" allowfullscreen="allowfullscreen" loading="lazy" frameborder="0"></iframe>

It's also great for light/dark modes, and for themes.