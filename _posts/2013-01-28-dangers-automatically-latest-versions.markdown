---
layout: post
title:  "The dangers of automatically using the latest versions"
permalink: dangers-automatically-latest-versions/
date:   2013-01-28 08:43:59
author: Last Rose Studios
categories: Programming
tags: 
cover: "./assets/instacode.png"
---

First let's clarify, when we say using the latest, we don't mean developing using the latest version, we mean linking to a CDN's latest version (for example of jQuery.)

Now the big question is why? the latest version addresses bugs, improves performance, etc. etc. etc. Right? Well the problem with that is sometimes functionality you might be depending on changed, or a bug that was fixed introduces new problems, or they may have updated the way a function works, or in extreme cases, deprecated or removed a function you where relying on.

This can have a pretty massive impact on client sites when that latest version that you have linked to updates. All of a sudden a bunch of your clients come back saying X is broken, and you're scratching your head thinking "well it was working yesterday, so what changed"

These changes may not impact usability (as the case was when bootstrap inverted the navbar from black to light grey) or it might make a site unusable (as the case with jQuery 1.9 for sites that are dependent on jQuery)

So the short of it is, once live, lock down the versions of any CDN resource you use and don't depend on -latest