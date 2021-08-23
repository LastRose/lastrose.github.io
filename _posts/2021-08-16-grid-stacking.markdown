---
layout: post
title:  "Grid Stacking for Backgrounds and Overlays"
permalink: grid-stacking/
date:   2021-08-16 7:14:00
author: Last Rose Studios
categories: Programming
tags: HTML CSS
cover: "./assets/instacode.png"
---

## Grid Stacking for BG images and Overlays

If you have worked with css for any length of time you probably have had to do something like this

```css
div {
  position: relative;
}

div:before {
  content:'';
  position: absolute;
  background-image: url('/someimage.jpg');
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
}
```

You can now do all that much easier with css grid.
```html
<div>
  <img src="/someimage.jpg" alt="alt text">
  <p>this is content</p>
</div>
```
```css
div {
  display: grid;
}
div > * {
  grid-area: 1/1/1/1;
}
```
<script async src=""></script>
<script  src="//jsfiddle.net/lastrose/fedtp19r/embed/result/"  async async></script>
### The pros of doing it this way

#### Accessibility
Doing it this way allows you to make the background image more accessible as you can add an alt tag to it. 

#### Video
Since you aren't limited to background-image, you can easily use video as a background

#### Stack more objects
Before you where limited to whatever you could fit before or after, though I suppose you could have also added

### Cleaner code
It's a lot less code, and (arguably) easier to understand what is going on.

### The cons of doing it this way

#### Image Size
The issue is that the grid size will be tied to the largest object
If your image is the largest object, than it will be the height of the image. 
This might not be a huge issue depending on how you plan on using it.

### Why couldn't we just absolute position the elements?
We could and we have. The biggest issue is if you have other content that is larger than the container, it would either overflow or get cut off (depending on what you've set overflow to), without expanding the container.
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/gq59nL6e/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0" async></iframe>

## Should I use it?
I would say that it would depend, but for most applications I think the grid method would be preferable to the absolute positioned one. The exception might be if you absolutely need to keep the aspect ratio, then you might need to use absolute positioning.