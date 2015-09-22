---
layout: post
title:  "How to Build a Custom Gallery in the Hubspot COS"
permalink: how-build-custom-gallery-hubspot
date:   2015-09-22 15:41:00
author: Last Rose Studios
categories: Programming
tags: Hubspot-COS
cover: "./assets/instacode.png"
---

One thing that has been a pain in the but for a while is the hubspot image sliders. They give you two options - a carousel or a lightbox layout, each with a few options, but the end user experience is pretty bad. Long loading times prevent some of the scripts from loading, causing glitches for clients. Having to explain that you have to wait for the page to finish loading before you can click on an image for the lightbox isn't something that is going to fly. People visiting the site will never know that - and just assume the site is broken.

We've been looking for a solution to this problem for a while, and recently cracked the output of the module. It requires doing `export_to_template_context=True` on the image slider module. Once that is done you have to pull the information out. You do that with the following code. - where `custom_slider` is the id you set for your slider.

```django
{% for slide in widget_data.custom_slider.slides %}
   <img src="{{ slide.img_src }}" alt="{{ slide.alt_text }}" title="{{ slide.caption }}">
{% endfor %}
```

of course you can format that image however you want at this point as you are in complete control of the output, want to use bxslider?

```django
<ul class="bxslider">
  \{% for slide in widget_data.custom_slider.slides %}
     <li><img src="{{ slide.img_src }}" alt="{{ slide.alt_text }}" title="{{ slide.caption }}"></li>
  \{% endfor %}
</ul>
```


want to use bootstrap3 carousel? *note, indexs are 1 based, unless you use index0 to specify 0 index.

```html
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    {% for slide in widget_data.custom_slider.slides %}
      <li data-target="#carousel-example-generic" data-slide-to="{{ loop.index0 }}" {% if loop.first %}class="active"{% endif %}></li>
    {% endfor %}
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    {% for slide in widget_data.custom_slider.slides %}
     <div class="item {% if loop.first %}active{% endif %}">
      <img src="{{ slide.img_src }}" alt="{{ slide.alt_text }}">
      <div class="carousel-caption">
        <p>{{ slide.caption }}</p>
      </div>
    </div>
    {% endfor %}
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
```

While I haven't tried, you can most likely access the other options by using widget_data.custom_slider, so for auto_advance use `widget_data.custom_slider.auto_advance`. If you need to figure out a variable you can use the developer view - it spits out a massive json array.

Hopefully this helps you create custom galleries in hubspot.