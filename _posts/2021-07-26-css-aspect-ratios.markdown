---
layout: post
title:  "CSS Aspect Ratios"
permalink: css-aspect-ratios/
date:   2021-07-26 7:14:00
author: Last Rose Studios
categories: Programming
tags: HTML CSS
cover: "./assets/instacode.png"
---

## Aspect Ratios

### In the past

In the past we relied on the padding hack. We absolute position the children, and have some content inside the container that has a padding that sets the height. (where the padding is a percentage of the width);

```css
.ratio-4x3 {
  position: relative;
}
.ratio-4x3::before {
  display: block;
  padding-bottom: 66%;
  content: '';
}
.ratio-4x3 > * {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/c75pjwd6/embedded/result/" allowfullscreen="allowfullscreen" loading="lazy" frameborder="0"></iframe>

### The new way

```css
.ratio-4x3 {
  aspect-ratio: 4/3
}
```
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/p31jtmkx/embedded/result/" allowfullscreen="allowfullscreen" loading="lazy" frameborder="0"></iframe>

### So what's the difference?

Other than being more concise, you can just apply it to the child element, meaning you don't need a wrapper. 

The other difference is how it handles the content expanding past the container. `aspect-ratio` is very loose and will expand to fit the content (though seems to be fine with images). The padding hack method is limited to the defined ratio, and any content more than that will be treaded as overflow (i.e you can hide, show or scroll).

here is an example
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/75h2de9a/embedded/result/" allowfullscreen="allowfullscreen" loading="lazy" frameborder="0"></iframe>

### Should I use it?
Browser support isn't great yet, so I wouldn't use it just yet, but it's something I'm looking forward to using in the future.
https://caniuse.com/?search=aspect-ratio