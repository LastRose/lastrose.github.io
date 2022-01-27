---
layout: post
title:  "Text Decoration Properties"
permalink: text-decoration/
date:   2022-01-27 09:43:59
author: Last Rose Studios
categories: Programming
tags: CSS
cover: "./assets/instacode.png"
---

For many years the most I did with text-decoration was to set it to either underline or none. I never really explored it more that that. Recently I stumbled accross the ability to set far more than just that.

Some of these are more recent properties. Most of these are fairly widely adopted (>90%) so there should be little issue with using these in production code.

## text-decoration-color

Usage is the same as any other color property, so don't really need an explanation here. 

For the longest time I would use border bottom to be able to have a different colored underline. Now with text-decoration-color, I can very easily set a different underline (or overline) color.

## text-decoration-line
This is the same as the old text-decoration property that we all grew up with. Possible values are `none`, `underline`, `overline`, and `line-through`. The values are pretty self-explanitory. 

The `text-decoration-line` is the only property that can handle multiple values ex. `text-decoration-line: overline underline line-through;`. At this time multipe values for the other properties is not supported.

## text-decoration-style
While it doesn't have all the options that `border-style` would have, it still offers `solid`, `double`, `dotted`, `dashed`, and `wavy`.

## text-decoration-thickness
With this property you can set the thickness of the line using a length or percent. You can also set `from-font`, though not all will have that information.

## text-decoration shorthand?
Yes you can use the `text-decoration` property with shorthand. So you can do something like `text-decoration: underline overline 2px red wavy;` and it will work. you can also start with setting text-decoration and just override a single property. For example you could change the style on hover.



## Bonus properties
Here are a few extra properties that you can use to style your text-decoration. These aren't part of the `text-decoration` shorthand, and aren't as widely supported.

### text-decoration-skip
This controls how/when the line gets broken. I'm not going to go into details about this one, as it is in itself a short hand for `text-decoration-skip-self`, `text-decoration-skip-box`, `text-decoration-skip-inset`, `text-decoration-skip-spaces`, `text-decoration-skip-ink` and it doesn't have widespread support yet (no support from Apple)

### text-underline-position & text-underline-offset
Not sure how useful these are right now, at least to RTL languages.


