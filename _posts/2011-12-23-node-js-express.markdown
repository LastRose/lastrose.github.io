---
layout: post
title:  "Node.JS with Express"
permalink: node-js-express
date:   2011-12-23 08:43:59
author: Last Rose Studios
categories: Programming
tags: Node.js express.js
cover: "./assets/instacode.png"
---

We've been interested in [node.js](http://nodejs.org/) for a while, however  just recently found out about the [express framework](http://expressjs.com). Having worked with ruby and sinatra, as discussed [here](http://www.lastrose.com/redis-db/ "A quick look at Sinatra"), one of the things we loved about sinatra was how easy it was to work with. Express does that, and in my opinion possibly better. Of course the language and framework is still young, so it will grow and develop.

## What is node.js?

Node.JS is a serverside language built on chrome's JavaScript runtime (V8). It is non-blocking, which means that rather than wait for a process to finish before running the next command, it can run the next command immediately. All this means that it is faster and more efficient. The best part is, if you know javascript, you know node.js.

## Why use node.js?

The fact that it is non-blocking is a big one. What this means is that when you try to get a file to read for example, the server can still process other commands, and will continue executing the function with the file once it has been retrieved. If it was blocking, it would prevent all other code from running until it the file was retrieved and then process it. What it is doing until that file is retrieved? Nothing. Meanwhile node.js can be doing anything else. This means that it can handle far more clients. It also has a package manager, similar to ruby gems called NPM. While it is still young, and not fully developed, it's a good start.

## What is Express

Express is a node.JS framework that handles creating the server, and has robust routing, dynamic view helpers, environmental based configuration, and a bunch of other features. It resembles Sinatra in that you give it the method and path, and then tell it what to do with that information. for example

{% highlight javascript %}
var app = express.createServer();  //creates the server

app.get('/', function(req, res){ //creates the root path
    res.send('Hello World'); //sends hello world back as a response
});

app.listen(3000); //tells the server what port to listen on.
{% endhighlight %}
where this gets interesting is when you do app.post, as this means you don't have to write some test to see if it was a post or not. This is also really useful when creating a restful API. In addition, Express supports a few different templating engines such as Haml, which we used in rails and loved, along with Jade (haml successor), and EJS (embeded javascript). I'm not too fond of EJS, however Jade is fantastic (if you don't mind the whole consistent space/tab issues). Documentation sadly is a bit sparse, as to be expected with any new framework, however what documentation is there is pretty solid and in many cases include code examples. Also lacking, in our opinion, are a lot of the helper methods we're used to having in codeignitor. This however, isn't the end of the world, and some of these helper methods might be found in NPM.