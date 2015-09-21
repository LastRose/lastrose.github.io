---
layout: post
title:  "My thoughts on Ruby On Rails"
permalink: thoughts-ruby-rails
date:   2011-10-07 08:43:59
author: Last Rose Studios
categories: Programming
tags: Rails Ruby
---

I finally broke down and decided to see what all the hype is about with Ruby on Rails.  Like all things, there are aspects I like about rails, and there are things I don't like about it. To begin, The things I don't like about rails are

*   **console commands can be slow** - whenever I run a command, any command I would have time to brew and drink a coffee if I was so inclined, or even write a blog post (I'm still waiting). Still faster than doing all the work manually, but sometimes it could be a close call. Note, this is because I am running windows.
*   **performance isn't that great** - Ruby isn't as fast as other languages out there, and rails doesn't really help much. When you look at all the framework is doing to helps us developers save time, it ends up having to do more work to display it properly. This is quickly becoming a thing of the past though.
*   **setup time is a bit long** - Ruby in general I found hard to setup, and rails particularly slow. Making sure the gems are the right versions, installed properly, getting everything working with your host. So far I've put almost 40 hours into it, and only now just got it all working, to be fair though, some of that time was lost because my laptop died on me, and I needed to reinstall and reconfigure all my rails environment, though thanks to git, most of the work I did accomplish was saved. Once you have it working though, you're ready for action.
*   **need hosting that supports ruby** - Not every host supports Ruby, and with all the headaches I had getting it to work when I tried Sinatra, I can understand why. They are around though if you look hard enough. Recently I tried heroku and have mixed feelings about the experience, though leaning more towards good.
*   **routes - **In rails, routes have to be defined in the routes.rb. While most of the time running a command will generate this for you, sometimes you have to enter it manually. This is the part I find somewhat stupid. Coming from CodeIgnitor, and having worked with Sinatra, the way ruby handles routes is so far the dumbest thing I've had to deal with. CodeIgniter makes the most sense to me so far, and Sinatra is all about routes and is so damn simple. Rails claims that it favors convention of configuration, and if that were true, than it would look to the the controllers first to see what functions are there, and failing that look at what routes are configured, rather than have to configure the routes.

Things I like

*   **Haml**- Haml lets you write

    {% highlight html %} 
<div class="hello">
    <h1>Text</h1>
</div>
    {% endhighlight %}

    as

    {% highlight haml %} 
    .hello
      %h1 Text
    {% endhighlight %}

    Despite my initial reservations about it, I do appreciate how fast this makes coding. I do worry that it introduces overhead when it comes time to serve the documents though, and it can get fussy with your indentation.
*   **SCSS** - I first encountered SCSS in my experience with a now abandonded project called webputty , and there definitely things I like about it. It allowed for nesting selectors to show inheritance (though if over used can cause repeated code), variables, and function in CSS. Furthermore it minifies the code. While not as powerful as a php css file, it can be easier to manage.
*   **belongs_to and has_many database relationships** - Rails lets you describe relationships in the model, and will handle most of the joins, selects and so on. The way rails handles database relationships is absolutely amazing, and by far one of my favorite features. I do worry about the performance hit it must cost, but for rapid prototyping this is a major selling point.
*   **git interaction** - With the rails workflow, there is no reason not to use version control. With PHP and other frameworks you spend a lot of time in an IDE, where versioning can be a bit of a pain in the butt. With rails, since you spend a lot of time on the command line, it's just a few characters away. Especially if you deploy to heroku, it's git and then heroku and that's it.
*   **3 environments** - Testing, Development and Production. This is genius, allowing you to have different DB's, configuration settings, and gems loaded based on the usage is brilliant, and makes working with rails a little easier.
*   **gems** - Making life easier, gems can really help speed up development by taking some mundane and common programming tasks and doing it for you. Despite my problem with some of the gem versions not working properly, or not working on windows.  Working with gems makes me want to look into PEAR for PHP, I just wonder how similar the experience is.
*   **testing** - Testing is a big part of rails (and from what I understand ruby in general). When I look at all that is done to make testing easy and accessible I can understand why, I love autotest (although it runs way too slow on my machine), and how easy it is to make testing part of your workflow.

Overall Once you know it, very good for rapid development of MVP, however performance and hosting flexibility are concerns. If I needed to rapidly prototype a largish application, I think I would use rails, however for smaller applications Sinatra is so far my favorite, and for most projects, Codeignitor is still my go to framework. There are still many more to play around with though, so I am by no means done.