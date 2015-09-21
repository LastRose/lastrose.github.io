---
layout: post
title:  "A quick look at Sinatra"
permalink: quick-look-sinatra
date:   2011-08-05 08:43:59
author: Last Rose Studios
categories: Programming
tags: Sinatra Ruby
---

I've been wanting to dig into ruby for a while now, and I recently came across a tutorial for building a URL shortener using the noSQL key value store [Redis](http://www.lastrose.com/redisdb/ "Discovering Redis") and a ruby framework called Sinatra (the tutorial can be found at [net.tuts.com](http://net.tutsplus.com/tutorials/ruby/how-to-build-a-shortlink-app-with-ruby-and-redis/)). After reading that I knew I wanted to use Sinatra in my next project despite my very low knowledge of ruby, it looked so incredibly simple. What I love about Sinatra is how you specify the method, and the route, making form submission a breeze and playing real well with REST.

{% highlight ruby %}
get '/' do

#something

end

post '/' do

#something

end

{% endhighlight %}

And that is it, use erb :viewname to tell it where to output it is simplicity itself. Of course my project, while initially seemed that simple, turned out to be a bit more complex when I sat down and looked at the structure and what was needed, but it was definitely quicker and easier to do it in Sinatra, despite my lack of ruby knowledge, than to do it in codeigniter. One of the biggest issues I had with the experience though was documentation, whenever I got stuck, I went to look online, and on more than one occasion came across documentation that was for a different version, and didn't apply to my version, or solutions that made use of things that where Rails specific. In the end, I managed to reverse engineer a lot of that stuff and complete my project. All in all, loved sinatra so much that a looked to see if I could find a PHP equivelant, and found [SLIM](http://www.slimframework.com/ "Slim PHP framework") and [laravel](http://laravel.com/). I haven't tried them yet, although they have been added to my "to try" list. For my first foray into Ruby though, Sinatra made things easy, letting me focus on learning ruby, and less on the framework.