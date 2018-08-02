---
layout: post
title:  "Break Out Of Containers"
permalink: break-out-of-containers/
date:   2018-08-02 7:14:00
author: Last Rose Studios
categories: Programming
tags: HTML CSS
cover: "./assets/instacode.png"
---

Have you ever been working with a CSS framework and needed a full-width block, but where stuck in a container that you couldn't close?
You can break out of that container using the following code

```css
.full-width { //or whatever your class is
  width: 100vw;
  position: relative;
  left: 50%;
  right: 50%;
  margin-left: -50vw;
  margin-right: -50vw;
}
```

It doesn't take into account scroll bars, so if you have a vertical scroll bar, it will add a horizontal scrollbar to deal with the scrollbar width that's off screen.
Know another way? Have a fix for the scrollbar issue? Leave a comment