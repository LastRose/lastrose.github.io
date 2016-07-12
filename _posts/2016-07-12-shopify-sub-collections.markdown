---
layout: post
title:  "Shopify Filter by Sub-Collection"
permalink: shopify-filter-sub-collection/
date:   2016-07-12 17:14:00
author: Last Rose Studios
categories: Programming
tags: Shopify
cover: "./assets/instacode.png"
---

If you want to have a sub-collection in shopify, there are a few different ways of tackling this. You could use a linkgroup, which has it's benefits, or you could use the method described here.

Step 1. Creating the Collections

First you need to have the main collection. In my case I had a collection named "Shoes".
Next you need to create a sub-collection, using a "-" as a separator, so "Shoes-Sneakers". This will create a handle called "shoes-sneakers" which we will need for later.
To make things easier to manage, I set the product types to the same as the collections, so it made populating the collections a bit easier.
When creating the collections, I had them set to grab the product type. Having the main collection to pull in products that had a product type that contained "shoes", and for the sub-category, I had it pull in all products that had a product type that matched "shoes-sneakers"

Step 2. Editing your Collections page.

On your collections page (or whatever snippet you are using) I added the following code. In this case I've used a select box, but you could just as easily replace the options with a list of links.


```liquid
{% raw %}
<select id="Collection" name="Collection">
	{% comment %}
		We need to figure out the base collection, as well as the sub-collection - if set - of the collection page we are on. To do that we split the handle.
	{% endcomment %}
  {% assign current_collection_type = collection.handle | split: '-' %}
  {% comment %}
	Display a "Show All" type option to unfilter. Doesn't need to be displayed on the all page though, since everything is already being shown.
  {% endcomment %}
  {% unless collection.handle == 'all' %}
    {% if current_collection_type[1] %}
    <option value="/collections/{{ current_collection_type[0] }}">All Types</option>
    {% else %}
    <option value="/collections/{{ current_collection_type[0] }}" selected>All Types</option>
    {% endif %}
  {% endunless %}
  {% for col in collections %}
    {% comment %}
		We need to figure out the base collection, as well as the sub-collection - if set - of each collection we are iterating through. To do that we split the handle.
	{% endcomment %}
	{% assign collection_type = col.handle | split: '-' %}

    {% comment %}
      If it is showing all collections, display a list of top-level collections
    {% endcomment %}
    {% if collection.handle == 'all' %}
	  {% comment %}
		Filter out all the collections that aren't top level
	  {% endcomment %}
      {% unless collection_type[1] %}
      <option value="{{ col.url }}">{{col.title}}</option>
      {% endunless %}
    {% else %}
	  {% comment %}
		If this iteration is a sub-collection
	  {% endcomment %}
      {% if collection_type[1] %}
		{% comment %}
			If this iteration is part of the current main collection show it (we don't want to list sub-collections that aren't part of the main collection )
		{% endcomment %}
        {% if collection_type[0] == current_collection_type[0] %}
		  {% comment %}
			Clean up the Title, remove the main category from the title
		  {% endcomment %}
          {% assign collection_title = col.title | split: '-' %}
          {% if collection.handle == col.handle %}
            <option value="{{ col.url }}" selected=>{{ collection_title[1] }}</option>
          {% else %}
            <option value="{{ col.url }}" >{{ collection_title[1] }}</option>
          {% endif %}
        {% endif %}
      {% endif %}
    {% endif %}
  {% endfor %}
</select>
</div>
{% endraw %}
```

If you are doing this with a select (like I did), you need some javascript to make it work. Nothing fancy, something like this will work. 
```javascript
  $(function() {
    $('#Collection')
      .bind('change', function() {
        window.location.href = $(this).val();
      })
  })
```

That's it, your done. 