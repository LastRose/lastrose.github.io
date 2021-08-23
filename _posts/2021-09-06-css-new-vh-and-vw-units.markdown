---
layout: post
title:  "Additional Units like VH and VW"
permalink: css-new-vh-and-vw-units/
date:   2021-09-06 7:14:00
author: Last Rose Studios
categories: Programming
tags: CSS
cover: "./assets/instacode.png"
---

## New Units for CSS

Ever try to use `width: 100vw` and get a horizontal scrollbar?
Have you ever experienced the [8 million dollar bug](https://cloudfour.com/thinks/a-bashful-button-worth-8-million/)? The new CSS units that add to vh and vw might be the answer.

Large Viewport `lvh|lvw|lvmin|lvmax`

Small Viewport  `svh|svw|svmin|svmax`

Dynamic Viewport  `dvh|dvw|dvmin|dvmax`

Have been added. 

If you try `width: 100dvw|svw|lvw` you won't get the annoying scroll bar.

It's currently part of a working draft, so not part of the official specs yet.
Browser support is unknown at this time but it works in chrome.