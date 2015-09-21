---
layout: post
title:  "Google Chrome for windows font rendering solution"
permalink: google-chrome-windows-font-rendering-solution
date:   2013-06-02 08:43:59
author: Last Rose Studios
categories: Programming
tags: CSS Design
---

One of the biggest pains about Chrome for windows is how it renders fonts. Internet Explorer has no issues (surprisingly) nor does Firefox, or Chrome for Mac. The problem is only on Chrome for windows. What's the problem? Jagged fonts that look awful and are not consistent with the other browsers.

In the past there was a great fix for this issue, exploiting text-shadow (even a transparent text-shadow would work) to force the font to be anti-aliased a bit. That worked for a while until a chrome update fixed the "bug" that this fix depended on. Now I recently discovered this article -  [http://www.fontspring.com/blog/smoother-web-font-rendering-chrome](http://www.fontspring.com/blog/smoother-web-font-rendering-chrome) dated August of 2012\. In that article they share that the answer is to declare the SVG resource before the ttf or woff resources when you declare your font sources. So instead of

{% highlight css %}
@font-face{
font-family:'Overlock';
src:url("/fonts/Overlock-OTF-webfont.eot");
src:url("/fonts/Overlock-OTF-webfont.eot?#iefix") format('embedded-opentype'),
url("/fonts/Overlock-OTF-webfont.woff") format('woff'),
url("/fonts/Overlock-OTF-webfont.ttf") format('truetype'),
url("/fonts/Overlock-OTF-webfont.svg#Overlock") format('svg');
font-weight:normal;
font-style:normal
}
{% endhighlight %}

use

{% highlight css %}
@font-face{
font-family:'Overlock';
src:url("/fonts/Overlock-OTF-webfont.eot");
src:url("/fonts/Overlock-OTF-webfont.eot?#iefix") format('embedded-opentype'),
url("/fonts/Overlock-OTF-webfont.svg#Overlock") format('svg'), /*move after eot*/
url("/fonts/Overlock-OTF-webfont.woff") format('woff'),
url("/fonts/Overlock-OTF-webfont.ttf") format('truetype');
font-weight:normal;
font-style:normal
}
{% endhighlight %}

Having tested out this method myself, I can confirm that it is a huge improvement. Try it out for yourself! I've also seen more recent articles that suggest using media queries to force the SVG for -webkit browsers, though I find it a bit cumbersome. The argument for media queries is that the SVG resource is larger, and not needed for mobile devices. I would counter argue that by using .SVG you are providing a more consistent experience, though there may be additional font hinting in the .ttf and .woff files. One huge downside is that you can't use certain hosted fonts (ex. Google fonts), but you can usually find most of the fonts offered by them elsewhere.