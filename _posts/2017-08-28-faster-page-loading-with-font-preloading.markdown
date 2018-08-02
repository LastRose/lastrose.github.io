---
layout: post
title:  "Faster Page Loading with Preloading"
permalink: preloading/
date:   2017-08-28 7:14:00
author: Last Rose Studios
categories: Programming
tags: HTML CSS
cover: "./assets/instacode.png"
---
With the introduction of preload, you can now tell the browser to start loading resources without blocking the document's onload event. It loads the resource into cache and holds it there until the document requests it. There is also prefetch, which differs from preload in the priority it's given. Preload assumes that you are going to be using the resource in the document that is being loaded, where prefetch assumes that you will be using it sometime in the future, for example on the next page. As a result, preload resources are given a higher priority than prefetch resources.

In theory this lets you load your stylesheets, scripts, fonts, images, audio, video, and other resources before your site calls for them. In practice this is best used to expose resources that are referenced inside scripts and stylesheets or other potentially blocking resources that won't be detected by the browser until it parses the stylesheet or script that calls that resource. Ideal candidates are font files, icons and background images. It doesnt change the priority of loading the resource, all it changes is how soon the browser knows about it.

As a bonus, it can help reduce the infamous "flash of unstyled text" or blank backgrounds behind hero images.

To implement this all you need to do is add a few lines of code to your header. Here is an example using Google fonts as a source for your fonts (using the standard embed method).
note: Google does browser detection, and serves font files optimized for that browser, so preloading Google fonts is not recommended, but for a example they will do fine.

```html
<head>
	<link rel="preload" as="font" crossorigin type="font/woff2" href="https://fonts.gstatic.com/s/opensans/v14/cJZKeOuBrn4kERxqtaUH3VtXRa8TVwTICgirnJhmVJw.woff2" />
	<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
</head>
```
or if you are using the @import method within another stylesheet
```html
<head>
	
	<link rel="preload" as="font" crossorigin type="font/woff2" href="https://fonts.gstatic.com/s/opensans/v14/cJZKeOuBrn4kERxqtaUH3VtXRa8TVwTICgirnJhmVJw.woff2" />
	<link rel="preload" as="style" crossorigin href="https://fonts.googleapis.com/css?family=Open+Sans" />
	<link href="yourstylesheet.css" rel="stylesheet">

</head>
```


What kind of improvement can you expect? Most sites that implemented this technique have seen an improvement of 1-2 seconds shaved off of load time. Shopify claims it improved loading time by 50% https://shopifyengineering.myshopify.com/blogs/engineering/how-17-lines-of-code-improved-shopify-com-loading-by-50. Our own experiences have shown similar improvements with one of our seeing a full 2 seconds shaved off the loading time. While your results may vary, you should see some sort of improvement.

The great part about this is that there is no feature detection necessary. Older browsers will simply ignore the directive. At the time of writing this is supported only by Chrome and Opera, however it will be supported in Firefox version 56 and higher, upcomming versions of Safari (11 and higher) and it is "under consideration" by Edge.

You can check out the preload w3 spec at https://w3c.github.io/preload/. If you want to find out more about the what is happening behind the scenes, take a look at this article https://medium.com/reloading/preload-prefetch-and-priorities-in-chrome-776165961bbf

