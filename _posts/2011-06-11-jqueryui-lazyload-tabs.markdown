---
layout: post
title:  "jQueryUI lazyload tabs"
permalink: jqueryui-lazyload-tabs
date:   2011-06-11 08:43:59
author: Last Rose Studios
categories: Programming
tags: jQuery
---

Example can be seen at [jsfiddle.net/Gr7Vp/](http://jsfiddle.net/Gr7Vp/) 

<iframe width="100%" height="300" src="http://jsfiddle.net/Gr7Vp/embedded/result" frameborder="0"></iframe>

In the tab initialization, we start off by disabling all the tabs, and enabling the cache. The cache is enabled so that the tab doesn't reload when you click on the tab. Next in the "load:" portion you can specify anything you want to happen when the tab has loaded (either play around with the content, or the tab heading).

{% highlight javascript %}
$("#tabs").tabs({
    disabled: [1,2,3,4,5,6,7,8,9],
    cache: true,
    load: function(event,ui){
        //(any javascript that needs to run)
        //$(ui.tab) to access the tabs
        //$(ui.panel) to access the loaded content
    }
});
{% endhighlight %}

Next I create a listener for the tabsload event, I could have also place this in the "load" portion of the initialization, but I only realized that now. This portion request the disabled array, and if there elements in it, will enable and load the first tab in that array. The enabling of that tab automatically removes it from the disabled array, and the loading will trigger this again, until there are no more tabs that are disabled.

{% highlight javascript %}
$("#tabs").bind("tabsload",function(event,ui){
    var disabled = $(this).tabs( "option", "disabled" );
    if(disabled.length>0){
        $(this).tabs( "enable" ,  disabled[0]);
        $(this).tabs( "load" , disabled[0]);
    }
})
{% endhighlight %}

The initial page load will load the contents of the first tab which will then trigger the tabs load event and set the whole thing in motion. We could probably make this a bit more flexible by adding a function to count the number of tabs, and add them to an array, but for this little snippet it should be enough.