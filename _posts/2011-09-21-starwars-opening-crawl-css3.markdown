---
layout: post
title:  "Starwars like opening crawl with css3"
permalink: starwars-opening-crawl-css3/
date:   2011-09-21 08:43:59
author: Last Rose Studios
categories: Programming
tags: CSS Tutorial
cover: "./assets/instacode.png"
---

I won't go through the minor details, but rather highlight the things that make this tick. I also set this up for webkit only, I tried getting it work in firefox, but couldn't get the rotateX to work (not yet supported?) and didn't bother with IE, as IE will only just be getting that working by the time css4 comes out. I set up one container (#example) as my viewport, which I give a fixed width and height, and set overflow to hidden. I also make sure to set it's position.  Setting it's position will allow me control over how the text will scroll.

```css
#example{
    pointer-events:none;
    position:relative;
    bottom:0px;
    width:300px;
    height:300px;
    overflow:hidden;
    -webkit-transform: perspective(200px) rotateX(45deg);
    transform: perspective(200px) rotateX(45deg);
}
```

You'll also notice that there is pointer-events:none, this is put so that if the container goes over my trigger link, it won't obstruct it's functionality, otherwise it might prevent me from being able to click. This container is then given a rotateX and perspective transform. Playing with perspective will effect how much depth it seems to have, and the rotateX angle will change the angle the text is at. These properties are what gives the text the appearance that it is getting smaller as it goes up. The text itself is set to position:absolute and given a position that is out of the viewport from the bottom, it is also given the pointer-events:none so that it doesn't interfere with the trigger link.

```css
#intro{
    pointer-events:none;
    position:absolute;
    top:500px;
    -webkit-transition:70s all;
    transition:70s all;
}
```

Here the transition is what causes the scrolling effect, as it transitions from the default state to the :target state. The whole thing is set off by using the :target pseudo-class. So a link that targets the text (a href="#intro"), will activate the css :target class. thanks to the transition in the base element will cause it to move towards the top of the viewport and out. this is what gives it the scrolling text appearance.

```css
#intro:target{
    top:-800px;
}
```

and here is the complete code.

```html
<html>
<head>
<style>
.html{margin:0;height:100%;}
body{background:black;position:relative;height:100%;}
.container{pointer-events:none;position:absolute;width:100%;bottom:0px;left:0px;height:700px;}
a{
    color:white;
    position:absolute;
    top:0px;
    left:0px;
    display:block;
    text-align:center;
    width:100%;

}
.episode{
    display:block;
    text-align:center;
    font-size:1.2em;
    font-family:'News Gothic',sans-serif;
    margin:20px;
}
#example{
    pointer-events:none;
    position:relative;
    font-size:26px;
    bottom:0px;
    width:300px;
    height:300px;
    padding:40px;
    overflow:hidden;
    margin:0px auto;
    -webkit-transform: perspective(200px) rotateX(45deg);
    transform: perspective(200px) rotateX(45deg);
    font-family:Univers,sans-serif;
    color:gold;
}
#intro{
    pointer-events:none;
    position:absolute;
    top:500px;
    -webkit-transition:70s all;
    transition:70s all;
}
#intro:target{
    top:-800px;
}
</style>
<body>
<a href="#intro">roll em</a>
<div class="container">    
<div id="example">
    <div id="intro">
        <span class="episode">Episode IV</span>

It is a period of civil war.
Rebel spaceships, striking from a
hidden base, have won their
first victory against the evil
Galactic Empire. During the battle,
Rebel spies managed to steal
secret plans to the Empire's ultimate
weapon, the Death Star, an armoured
space station with enough power to
destroy an entire planet. Pursued by the
Empire's sinister agents, Princess
Leia races home aboard her starship,
custodian of the stolen plans that can save
her people and restore freedom to the

galaxy...
    </div>
</div>
</div>
</body>
```

## See it in Action

[Click here](http://jsfiddle.net/lastrose/Z8MUB/embedded/result/) to see it full screen, takes a few seconds to start

<iframe src="http://jsfiddle.net/lastrose/Z8MUB/embedded/result" height="300" width="100%" frameborder="0"></iframe>