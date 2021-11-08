---
layout: post
title:  ":visited can't use css variables"
permalink: /css-variables-visited
date:   2021-11-08 7:14:00
author: Last Rose Studios
categories: Programming
tags: CSS
cover: "./assets/instacode.png"
---

## :Visited can't use css variables

After spending some time to figure out why I couldn't get my `visited` link styles to work, I looked at the specifications. 
It turns out that the only properties that are allowed on visited links are `color`, `background-color`, `border-color` and it's positional varients, `column-rule-color`,  `outline-color`, `text-decoration-color`, and `text-emphasis-color`.
SVG `fill` and `stroke` are also allowable. 

Also, the alpha channel is ignored. If the non-visited state has an alpha value of 0, than all of the visited styles will be ignored. 
