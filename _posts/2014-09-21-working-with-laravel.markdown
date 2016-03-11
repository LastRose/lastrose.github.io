---
layout: post
title:  "Working with Laravel"
permalink: working-with-laravel/
date:   2014-09-21 15:14:00
author: Last Rose Studios
categories: Programming
tags: PHP Laravel
cover: "./assets/instacode.png"
---

Worked on a project that was initially built using Symfony. The original work was well done, however the intial developer couldn't continue due to a conflict of interest, and so the project was outsourced overseas. I could get into details on how bad it was, but that is the topic for another day.

When looking at solutions we considered several frameworks - CodeIgniter, Laravel and Symphony where among the choices. Ultimately we chose Laravel as it seemed to have the best multilanguage management, and the task scheduling it offered provided some answers to a few challenges we had. It seemed like a perfect fit.

Working with Laravel was a great experience. There is a strong culture of Test Driven Development. There is a wealth of instructions out there that can help you get running relatively quickly. I say relatively because even with the great resources, it still take a lot of time to setup and configure everything. 

I ended up running into a lot of problems - some of the larger ones where
-   Language support was problematic - Overall it did work, but it didn't support resources at the time, and it also cause some other issues (below) 
-   I couldn't unit test (multilingual support caused an error that prevented unit tests from running)
-   Task scheduling option we chose was bugged, and while they did fix it in an updated version - that update didn't work on our servers OS.

Overall, once the setup was done Laravel was great to work with. It felt a lot like Ruby, but with faster performance. If I was to do another large project I would consider it. It's not worth it for smaller projects simply because of the setup time.
