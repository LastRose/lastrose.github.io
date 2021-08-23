---
layout: post
title:  "Flow Relative Values"
permalink: css-flow-relative-values/
date:   2021-08-30 7:14:00
author: Last Rose Studios
categories: Programming
tags: CSS
cover: "./assets/instacode.png"
---


## New CSS Properties

### Inline and Block
inline and block flow relative values (indicating that it has to do with the flow of content and not to be confused with an inline or block level element) have been introduced as a way of targeting the start, sides and end of a block element. 

You can use it to target size or `margin`, `padding`, `offset`, `border` (inlcuding `border-width`, `border-style`, `border-color`) and `border-radius`. You can use the shorthand of `inline` or `block`, or you can use `inline|block-start` or `inline|block-end` to target the start or end.

Here is a quick example of some of the inline and block properties
```css
div {
  block-size: 100px;
  inline-size: 50px;
  border-block-start-width: 8px;
  border-block-end-width: 2px;
  border-block-color: red;
  border-block-style: solid;
  border-inline: 1px dotted green;
  padding-block: 10px;
  padding-inline: 4px;
  margin-inline: auto;
}
```

### Float and Text-Align
Float and text align also got these flow relative values. You can now do `float|clear: inline-start|end` or `text-align: start|end`

### Why is this useful?
Why is this useful? If you deal mostly with english this probably isn't that useful (though `margin-inline: auto;` is easier, and has less impact on other styles that something like `margin: 0 auto;` ). Where it does become useful is if you have to deal with ltr or rtl, or languages that use vertical script (or table headers). This lets you have a more flexible stylesheet for all languages. No more 
```css
.rtl div { padding-right: 1rem } 
.ltr div { padding-left: 1rem } 
.vlr div { padding-top: 1rem }
```
now you can just have `div { padding-block-start: 1rem; }`

<script  src="//jsfiddle.net/lastrose/v8Lu5xjr/embedded/result/"  async></script>

You can read more about it here https://drafts.csswg.org/css-logical/#page
Keep in mind that it is still a draft, so it might change however browser support is pretty good with all current browsers supporting it. Older versions of Safari and IE might have some trouble with it though, so keep that in mind.