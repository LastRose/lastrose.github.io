---
layout: post
title:  "Working on the Hubspot COS"
permalink: working-on-hubspot
date:   2015-09-21 15:14:00
author: Last Rose Studios
categories: Programming
tags: Hubspot-COS
cover: "./assets/instacode.png"
---

We've been working with hubspot ever since they launched their new COS, and have built a number of sites on the platform. To be honest, it hasn't been all a great experience.
Here are a few of the problems we've had
-   *Little to no documentation* - though this has improved massively since they launched, there are still a bunch of holes in the documentation.
-   *Visual designer based on bootstrap 2.3* - while bootstrap is great, version 4 is right around the corner, and 3 has been out for a while. I understand why they chose to go that direction (two breakpoints are easier to maintain)
-   *They claim it is a responsive COS* - This claim is completely false, it's like stating wordpress or drupal are responsive. The platform in and of itself is not responsive, the themes that you develop for it are.
-   *Wrappers* - Everything in hubspot is wrapped, the wrapped again, and put in another wrapper for good measure before they place that in a wrapper. How annoying is it to try to get a page title only to be given some span wrapped mess of html instead of a simple value. Or try to to use flexbox on tripple wrapped elements. In some cases you can force it to play nice by using `no_wrapper=True` but that only works on modules, and not on values or on modules added by the user. These wrappers can completely ruin a layout.

I could go on (I really could), but the truth is that despite it's defeciencies, the team at hubspot does make massive efforts to address issues and improve the platform. Case in point being the documentation. Also keep in mind that the COS is only about 2 years old, how limited was wordpress at 2 years old?

Moving on to the other side of the argument - One of the things that Hubspot does really well is custom page layouts. With wordpress you are pretty limited, and while you can always add aditional fields, the process is far more complicated in wordpress compared to hubspot. It makes picking a CTA or form for regular content pages a peice of cake. There are also some pretty amazing things you can do with smart content. 

At the end of the day, Hubspot presents a lot of challenges to develop for, but not more than any other platform. The only difference is that the community is smaller (for the moment). 