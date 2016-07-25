---
layout: post
title:  "Pan a background image using CSS"
permalink: css-hero-image-pan/
date:   2016-07-25 7:14:00
author: Last Rose Studios
categories: Programming
tags: HTML CSS
cover: "./assets/instacode.png"
---

If you have ever had a background image that you wanted to show more of, consider panning through it using this technique. 

<script async src="//jsfiddle.net/lastrose/fxac6y0y/embed/result/"></script>

First we create a simple header - you could mark it up however you wish, however to keep things simple I did

```html
<header>
	<h1>Content</h1>
</header>
```

Next for the CSS, the first few lines are to position things, so style it as you please. The important thing here is the background and animation bits. Also keep in mind that vendor prefixes may be required.

```CSS
header {
  height: 200px;
  display:flex;
  align-items: center;
  justify-content: center;
  background-size: cover;
  background-image: url(https://images.unsplash.com/photo-1468245856972-a0333f3f8293); 
  animation-name: move;
  animation-duration: 40s;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
}
h1 { color: white; }

@keyframes move {
  0%, 100% {
    background-position: top;
  }
  50% {
    background-position: bottom;
  }
}
```
