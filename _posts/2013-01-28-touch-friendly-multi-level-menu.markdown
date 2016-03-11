---
layout: post
title:  "A touch friendly multi-level menu"
permalink: touch-friendly-multi-level-menu/
date:   2013-01-28 08:43:59
author: Last Rose Studios
categories: Programming
tags: HTML CSS Navigation
cover: "./assets/instacode.png"
---

Multi-Level menus are the foundation of many content-rich sites. They allow users to get to content without too much effort or searching. One click to get to what they want. That changed with widespread usage of smart phones and tablets.

With touch screen becoming the main input method of these devices, many multi-level menus became unusable. This issue was partially solved using media-queries allowing for a different styled menu to display for people using phones or tablets. This solved the issue for a while, until more recently. The problem with media-queries is that they depend on screen size, and with many newer touch screen devices (including in here many new windows 8 tablets) the screen resolution can no longer be used (briefly had a 12" windows 8 tablet with the same resolution as a 27" screen) as such media queries went out the window. Browser sniffing is an equally useless option, and remapping touch to hover, and then making the second touch a click is just a mess. So what is the solution? The solution is to keep the menu's behaviour the same, but add a button beside a menu element that when clicked would open a menu and keep it open. This allows touch screen users access the elements beneath. There are a number of ways to do that, but this is so far the best way I've found to implement it. [JS Bin](http://jsbin.com/aloxag/9/embed?live)
{% highlight html %}
<div class="navigation">
<nav>
  <ul role="navigation">
    <li class="skip"><a href="#top">Skip to Content</a></li>
    <li><a href="./index.html">Home</a></li>
    <li id="navabout">
      <a class="less" href="#" title="Click to Close">X</a>
      <a class="more" id="navabout" href="#navabout" title="Click to Open">Z</a>
      <a href="#">About</a>
      <ul>
        <li><a href="">Sub Nav 1</a></li>
        <li><a href="">Sub Nav 2</a></li>
        <li><a href="">Sub Nav 3</a></li>
      </ul>
    </li>
  </ul>
</nav>
</div>
{% endhighlight %}

{% highlight css %}
.navigation {
  position: relative;
  z-index: 1;
  background: #2a2a2a;
  width: 100%;
  height: 41px;
}
nav {
  margin: 0px 0px;
}
nav .active {
  color: #fff;
  text-shadow: 0 0 1px #fff;
}
nav .skip {
  display: none;
}
nav ul {
  width: 100%;
  position: relative;
  margin: 0;
  padding: 0;
}
nav li {
  float: left;
  text-align: center;
  position: relative;
  list-style: none;
}
nav li a {
  font-size: 14px;
  background: #2a2a2a;
  padding: 10px;
  display: block;
  color: #ccc;
  text-decoration: none;
  border-right: 1px solid #434343;
  padding: 10px 20px;
}
nav li a:hover {
  background: #434343;
  border-bottom: none;
  color: #fff;
}
nav li a:not(:only-of-type) {
  padding-right: 50px;
}
nav li a:not(:only-of-type).more,
nav li a:not(:only-of-type).less {
  position: absolute;
  top: 0;
  right: 0;
  display: block;
  padding: 0px 5px;
  width: 25%;
  text-align: center;
  z-index: 500;
  font-size: 24px;
  line-height: 38px;
}
nav li a:not(:only-of-type).more:hover,
nav li a:not(:only-of-type).less:hover {
  background: #888;
}
nav li:target ul li {
  height: 40px;
  border-top: none;
}
nav li:target a:not(:only-of-type).less {
  z-index: 1000;
}
nav li:target a:not(:only-of-type).more {
  z-index: 0;
}
nav li ul {
  padding: 0;
  position: absolute;
}
nav li ul li {
  width: 200px;
  float: none;
  border-top: none;
  margin-left: -1px;
  height: 0px;
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  -o-transition: all 0.5s;
  transition: all 0.5s;
  overflow: hidden;
  margin-bottom: 0;
}
nav li ul li a {
  background: #434343;
  line-height: 21px;
  border: none;
}
nav li ul li a:hover {
  background: #5c5c5c;
}
nav li:last-child a {
  border: none;
}
nav li:hover li {
  height: 40px;
}
@media all and (max-width: 700px) {
  .navigation {
    height: auto;
  }
  .navigation .lang {
    clear: both;
    float: none;
    margin-left: 0;
  }
  .navigation form {
    float: right;
    margin-right: 40px;
  }
  nav {
    margin: 0px;
    width: 100%;
    display: block;
  }
  nav .skip {
    display: block;
    background: #000;
    font-weight: bold;
  }
  nav ul {
    width: 100%;
    display: block;
  }
  nav li {
    text-align: left;
    float: none;
    border-bottom: 1px solid #434343;
    border-right: none;
  }
  nav li:hover li {
    height: 0px;
  }
  nav li ul {
    position: relative;
  }
  nav li ul a {
    padding-left: 20px;
  }
  nav li ul li {
    height: 0;
    position: relative;
    width: auto;
    border: none;
  }
  nav li a.more,
  nav li a.less {
    padding: 0px;
  }
}
{% endhighlight %}

Click [here](http://jsbin.com/aloxag/9) to see it in action The nice part about it is that there is no javascript involved, using :target to display the dropdown. Disadvantage though is that it requires ID's for each dropdown menu, and a bit of extra code to include the open and close buttons. Also some of the features used don't work in older browsers (*cough IE*) but seeing as how the older browsers that don't support :target generally don't have a touch screen, I think it's safe enough. Based on this, it should be fairly simple to add another level if needed.