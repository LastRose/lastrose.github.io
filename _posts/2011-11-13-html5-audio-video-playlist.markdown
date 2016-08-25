---
layout: post
title:  "HTML5 Audio and Video and how to make a playlist"
permalink: html5-audio-video-playlist/
date:   2011-11-13 08:43:59
author: Last Rose Studios
categories: Programming
tags: HTML Tutorial
cover: "./assets/instacode.png"
---

## What are HTML5 audio and HTML5 video

With the release of HTML5 A whole bunch of new elements where introduced including the audio and video elements. The huge advantage of these new elements is that most browsers today can understand these new HTML5 elements, this is great since Adobe is no longer supporting flash for mobile. Also since the audio and video are now a real element on the page and not some flash addon, you have an even greater level of control over these media elements.

For those of you saying "what about browsers that don't support the audio or video element?" these browsers treat them like a div, and most of the information is lost, however since it reads it like a div, you can specify a fallback inside the tag. Below is an example of how to mark up an html5 audio or html5 video element. I'm only going to show the audio element, however the process is identical for both elements. Below is a simple example of how to markup an audio or video element.

```html
<audio id="audio" preload="auto" tabindex="0" controls="" >
  <source src="http://www.archive.org/download/bolero_69/Bolero.mp3">
  Your Fallback goes here
</audio>
```

Most commonly the fallback is a flash version of the video or audio. One of the nice things about the audio and video element is that if it sees a valid source, then it will ignore the fallback content, it only triggers in older browsers. You can also specify multiple sources (more for the video element where there are still a few competing standards). and the browser will select the first one that it can understand.

## The HTML for the Playlists

<iframe src="http://jsfiddle.net/lastrose/vkMqR/embedded/result" height="300" width="100%" frameborder="0"></iframe>In addition to the code above, we need to add a list of songs. We like to do it by using an unordered list, although you could equally use an ordered list to get track numbers. You could go into more detail with the track length, or more detailed information, however for the purposes of this tutorial, I'm keeping it simple.

```html
<ul id="playlist">
        <li class="active">
            <a href="http://www.archive.org/download/bolero_69/Bolero.mp3">
                Ravel Bolero
            </a>
        </li>
        <li>
            <a href="http://www.archive.org/download/MoonlightSonata_755/Beethoven-MoonlightSonata.mp3">
                Moonlight Sonata - Beethoven
            </a>
        </li>
        <li>
            <a href="http://www.archive.org/download/CanonInD_261/CanoninD.mp3">
                Canon in D Pachabel
            </a>
        </li>
        <li>
            <a href="http://www.archive.org/download/PatrikbkarlChamberSymph/PatrikbkarlChamberSymph_vbr_mp3.zip">
                patrikbkarl chamber symph
            </a>
        </li>
    </ul>
```

As for HTML, that's it. Add a bit of CSS to get it styled

```css
#playlist,audio{background:#666;width:400px;padding:20px;}
.active a{color:#5DB0E6;text-decoration:none;}
li a{color:#eeeedd;background:#333;padding:5px;display:block;}
li a:hover{text-decoration:none;}
```

And now for the big part, the javascript. The Javascript for HTML5 Playlists Now that we have the base, lets talk about the javascript. HTML5 Audio and HTML5 Video have an API that you can hook into with javascript that lets you manipulate the video (or use the video to manipulate your html). In this particular instance, we are going to use the ENDED event as well as play() and volume() as well as load().

```javascript

init();
function init(){
    var current = 0;
    var audio = $('#audio');
    var playlist = $('#playlist');
    var tracks = playlist.find('li a');
    var len = tracks.length - 1;
    audio[0].volume = .10;
    audio[0].play();
    playlist.find('a').click(function(e){
        e.preventDefault();
        link = $(this);
        current = link.parent().index();
        run(link, audio[0]);
    });
    audio[0].addEventListener('ended',function(e){
        current++;
        if(current == len){
            current = 0;
            link = playlist.find('a')[0];
        }else{
            link = playlist.find('a')[current];    
        }
        run($(link),audio[0]);
    });
}
function run(link, player){
        player.src = link.attr('href');
        par = link.parent();
        par.addClass('active').siblings().removeClass('active');
        player.load();
        player.play();
}
```

## So what does all that do?

Well we start off by declaring our global variables, and than initialize the audio element. We set the current index to 0, and using jquery (though you could use getElementByID as well) get the audio (or video) element we want to control, the playlist find the tracks, get the total number of tracks (-1 because the tracks are a 0 index array). We set the volume to 10% (so that the sound doesn't blast our visitors), and than start playing our audio or video. Note that automatically paying audio and video is not really a good practice (unless for video you have volume at 0) as people don't like getting surprised with sound and than have to hunt it down to mute it. Next we set up our listeners, we listen for clicks in our playlist, as well as for when our track is ended (using the new ended event) so that we can play the next track. In this example we have it looping, so when it gets to the end of the play list, it goes back to the beginning. finally we have a function that actually loads up and plays the song on the playlist. It gets the source from the link, changes the class to active (for css styling), loads the file (.load() is not to be confused with the jquery .load() method, the html5 .load() api hook is so that the html5 audio or video element knows to start loading a new resource) and than play the newly loaded resource. And that is it for HTML5 Audio and HTML5 Video Playlists. You can see the example [here](http://jsfiddle.net/lastrose/vkMqR/)
