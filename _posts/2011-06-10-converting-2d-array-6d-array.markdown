---
layout: post
title:  "Converting a 2d array into a 6d array"
permalink: converting-2d-array-6d-array/
date:   2011-06-10 08:43:59
author: Last Rose Studios
categories: Programming
tags: PHP
cover: "./assets/instacode.png"
---

The first version of this blog was written in CodeIgniter, mostly just to give it a try. I had it using the MetaWeblog API which was a useless feature for me, but was still a cool thing to accomplish. In the end I converted the whole thing over to wordpress, since blogging is what wordpress is for. During the course of the CodeIgniter bit though I had to deal with nested comments. For the comments section I wanted to keep it simple. 3 generations of comments, easy right? So for the database i have the basics

<pre>comment_id
name
datetime
comment</pre>

and to handle the different generations I added

<pre>parent_id //null if first gen
grandparent_id //null if first or second gen</pre>

Great, so that's in a database, but now when I want to pull it out how do i organize it? What is the most effective way of rebuilding it into an array that I can easily use. I wanted to go through my array as little as possible. Here is what I came up with.

```php
foreach($test as $val) {
  if ($val['grandparent_id']) {
    $new[$val['grandparent_id']]['children'][$val['parent_id']]['children'][$val['comment_id']] = $val;
  } else if ($val['parent_id']) {
    $new[$val['parent_id']]['children'][$val['comment_id']] = $val;
  } else {
    $new[$val['comment_id']] = $val;
  }
}
```

I'm going through the aray and building a new more complex one as I go along. Total I will go through the array twice, once in this method here, and I'll go through the new array in order to display it. The end array would look a little like this

```php
Array(
  [1] = > Array(
    [comment_id] => 1
    [name] => name
    [url] => <a href = "https://www.something.com/">www.something.com</a>
    [parent_id] =>
    [grandparent_id] =>
    [children] => Array (
      [2] => Array(
        [comment_id] => 2
        [name] => name
        [url] => <a href="https:/ / www.something.com / ">www.something.com</a>
        [parent_id] => 1
        [grandparent_id] =>
        [children] => Array(
          [6] => Array(
            [comment_id] => 6
            [name] => name
            [url] => <a href="https: //www.something.com/">www.something.com</a>
            [parent_id] = > 2
            [grandparent_id] = > 1
          )
        )
      )
    )
  )
)
```

That was the most efficient way I could think of. If anyone has a better way of handling it let me know. While this is done in PHP the logic should work in most other programming languages.