---
layout: post
title:  "No More jQuery"
permalink: getting-rid-of-jquery/
date:   2021-05-17 7:14:00
author: Last Rose Studios
categories: Programming
tags: JS
cover: "./assets/instacode.png"
---

## No More jQuery
For around a decade and a half we've been using jQuery to make javascript easier, and more consistant. It's time has come to an end though. For the past few years development on jQuery has slowed, and developers have been moving away from jQuery.

A few of the platforms we use announced that they will no longer be included jQuery, so we made the decision to remove jQuery from everything we do. It meant finding new libraries, though many of them had already pivoted away from jQuery. 

Javascript now has great selector support with `document.querySelector()`, there aren't many inconsistancies with browsers (though older browser support is still a thing). There really isn't a good reason to keep using jQuery.

## The Transition - Internal Code
In most projects we try to add as little javascript as possible. But a little javascript is still some javascript. 

We had to re-write all of our code so that it doesn't use jQuery. Overall it went well, and while it isn't as concise as some of the jQuery was, it is more readable overall. We won't get into the details of all the changes, but overall the process wasn't all that difficult.

## The Transition - Third Party
We had already adopted Bootstrap 5 when a framework was needed and that no longer needs jQuery - though we rarely use Bootstrap's javascript offerings.

Almost all of our projects make use of a parallax plugin. We've tried a few and prefer those that are simple. We stumbled across Jarallax, and found it fit our needs perfectly and performed better than some of the old ones we used.

Another library that we use often in our projects is a lightbox. We've tried a few and had used Fancybox https://fancyapps.com/docs/ui/fancybox/ on a few of our projects. While we where looking for a jQuery free lightbox we found that FancyBox had just come out with a new version (not fully released when we discovered it), which was perfect at that time and has since improved and expanded to include a carousel and other features.

We rarely use carousels, but they do come up occasionally. Luckily when we needed one, we found that Fancybox had got that working well.

## Should you ditch jQuery
Should you get rid of jQuery? It depends. If you have a large codebase written with jQuery, it might be a bit more difficult and might not make financial sense. Also, if you have dependancies on libraries that require jQuery and you can't find an alternative, than you might not have a choice but to keep jQuery.

If you are writing new code, are re-writing existing code and don't have any third-party dependancies on jQuery, then get rid of it.