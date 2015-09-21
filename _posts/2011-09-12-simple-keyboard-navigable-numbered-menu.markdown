---
layout: post
title:  "Simple keyboard navigable numbered menu."
permalink: simple-keyboard-navigable-numbered-menu
date:   2011-09-12 08:43:59
author: Last Rose Studios
categories: Programming
tags: CSS HTML
---

After seeing a numbered navigation on a site that was non-functional, it gave me an idea for a functional one. I built this up as a little mobile style site, though I haven't really tested it on a mobile device so I can't say for sure how well this works on a mobile platform. Example of it in action can be seen [here](http://jsfiddle.net/lastrose/JWUuL/embedded/result/)
<iframe src="http://jsfiddle.net/lastrose/JWUuL/embedded/result/" width="100%" height="300" frameborder="0"></iframe>
The javascript is optional and it works very well without it (using access keys).

{% highlight html %}
<!doctype html>
<html>
<head>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.3.js"></script>

  <style type="text/css">
    div.content{
    max-width:320px;
    margin:0px auto;
    display:none;
    clear:both;
    padding:20px;
}
div.content:target{display:block;}
span.number{font-size:24px;display:block;padding:20px;}
nav{max-width:320px;margin:0px auto;}
nav ol{
    padding:0px;
    margin:0px;
}
nav ol li{
    display:block;
    float:left;
    text-align:center;
    width:33%;
}
nav ol li a{
    display:block;
    width:100%;
    height:100px;
    background:#fefefe;
    color:#666;
    box-shadow:inset 0px 0px 5px rgba(0,0,0,.25);
}
nav ol li a:hover{
    background:#fefecc;
}

</style>

<script type="text/javascript">
$(window).load(function(){
        $("body").keypress(function(event) {
            event.preventDefault();
            $('div[class*="number-"]').hide();
            $('div.number-'+String.fromCharCode(event.which)).show();
        });
        $("nav li a").click(function(event){
            event.preventDefault();
            $('div[class*="number-"]').hide();
            $($(this).attr('href')).show();
        });
});
</script>
</head>
<body>
  <nav>
    <ol>
        <li class="number-1">
            <a href="#about" accesskey="1"><span class="number">1</span>About</a>
        </li>
        <li class="number-2">
            <a href="#news" accesskey="2"><span class="number">2</span>News</a>
        </li>
        <li class="number-3">
            <a href="#services" accesskey="3"><span class="number">3</span>Services</a>
        </li>
        <li class="number-4">
            <a href="#products" accesskey="4"><span class="number">4</span>Products</a>
        </li>
        <li class="number-5">
            <a href="#faq" accesskey="5"><span class="number">5</span>FAQ</a>
        </li>
        <li class="number-6">
            <a href="#register" accesskey="6"><span class="number">6</span>Register</a>
        </li>
        <li class="number-7">
            <a href="#cats" accesskey="7"><span class="number">7</span>Random Cats</a>
        </li>
        <li class="number-8">
            <a href="#links" accesskey="8"><span class="number">8</span>Links</a>
        </li>
        <li class="number-9">
            <a href="#contact" accesskey="9"><span class="number">9</span>Contact Us</a>
        </li>
    </ol>
</nav>

<div class="content number-1" id="about">This is an about section</div>
<div class="content number-2" id="news">This is the news</div>
<div class="content number-3" id="services">This is the service section</div>
<div class="content number-4" id="products">This is the products section</div>
<div class="content number-5" id="faq">This is the FAQ page</div>
<div class="content number-6" id="register">This is the registration page</div>
<div class="content number-7" id="cats">This is just a bunch of random cats</div>
<div class="content number-8" id="links">This is a list of links</div>
<div class="content number-9" id="contact">This is a contact page</div>
</body></html>
{% endhighlight %}