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
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/c75pjwd6/embedded/" allowfullscreen="allowfullscreen" async frameborder="0"></iframe>

### The new way
```css
.ratio-4x3 {
  aspect-ratio: 4/3
}
```
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/p31jtmkx/embedded/result/" allowfullscreen="allowfullscreen" async frameborder="0"></iframe>
