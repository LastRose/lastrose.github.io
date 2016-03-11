---
layout: post
title:  "Marking Up with Microdata"
permalink: marking-microdata
date:   2011-11-07 08:43:59
author: Last Rose Studios
categories: Programming
tags: HTML
cover: "./assets/instacode.png"
---

In a project we recently worked on, we were faced with the decision between RDFa (xHTML), Microformats(the oldest of the standards) and Microdata(html5).  Considering that we were working in HTML5, RDFa was immediately out. Microformats was a strong contender, however ultimately, microdata won out.

## First of all what is Microdata and why is it usefull?

Microdata, Microformats and RDFa are ways of adding additional meaning to webpage so that search engines can have a better idea of what the page is about. &lt;span&gt;5143081505&lt;/span&gt; is just a bunch of numbers to a search engine (though they can reasonably guess that it is a phone number), however &lt;span itemprop="telephone"&gt;5143081505&lt;/span&gt; tells search engines that this is definately a phone number. and based on where it is can determine who that phone number belongs to (demonstrated in more detail later).

## Why did we choose Microdata?

As mentioned above, RDFa was immediately out simply because we weren't working with xHTML. After a great deal of research looking at the different solutions we initially were leaning towards Microformats, however while Microformats was good for the contact section we were working on, Microdata offered better structure for products, and since it was an HTML5 based project we thought it most appropriate to use an HTML5 solution.

## What about search engines?

We wondered initially if Microdata would perform as well in search engines, since Microformat was the older format. After looking at it closely, we discovered the Bing, Yahoo and Google have come together and offer a shared collection of schema's available at [Schema.org](http://schema.org). If Bing, Yahoo and Google are offering this information, then for sure they are using it.

## How do we use Microdata?

We find that the best way to learn how to use something is to see it in action, so we have included two different examples that you would see day to day.

## A Simple Contact Page

{% highlight html %}
<div itemscope itemtype="http://schema.org/Person">
  <span itemprop="name">Persons Name</span>
  <img src="http://link.to/their/image.jpg" itemprop="image" />

  <span itemprop="jobTitle">Profession</span>
  <div itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">
    <span itemprop="streetAddress">The Street Address</span>
    <span itemprop="addressLocality">The City</span>,
    <span itemprop="addressRegion">The State/Prov</span>
    <span itemprop="postalCode">Postal/Zip Code</span>
  </div>
  <span itemprop="telephone">(425) 123-4567</span>
  <!-- alternatively you could place this in a span and omit the mailto -->
  <a href="mailto:email@address.com" itemprop="email">email.address.com</a>

  Home page:
  <a href="http://link.to/website" itemprop="url">link.to/website</a>
</div>
{% endhighlight %}

## A Blog Post

{% highlight html %}
<!doctype html>
<head>
<title>title</title>
</head>
<body>
<article itemscope itemtype="http://schema.org/BlogPosting">
  <header id="postHeader" class="postHeader">
    <h1 itemprop="headline">The Title Of your Post</h1>

    <!-- rel="author" can also be used instead. Google also has a thing where you link it to the google profiles-->
    <div class="author"><a itemprop="author" href="http://link.to/authors/profile">Author</a></div> 

    <!-- a bit of controversy on this one, as time was the accepted way of doing it, and was removed from the spec in favor of a data element with microformat, and then brought back. I've marked it up using microdata and the time element, however we get the feeling the controversy on this one is not over yet.-->
    <div class="time">Published <time itemprop="datePublished" datetime="2011-11-07T09:00Z">Today</time></div>
    <div class="categories">under the categories
      <ul>
        <li><a href="http://link.to/category/1"><span itemprop="articleSection">Category1</span></a></li>
        <li><a href="http://link.to/category/2"><span itemprop="articleSection">Category2</span></a></li>
        <li><a href="http://link.to/category/3"><span itemprop="articleSection">Category3</span></a></li>
        <li><a href="http://link.to/category/4"><span itemprop="articleSection">Category4</span></a></li>
      </ul>
    </div>
  </header>
  <section id="thePost" class="Post">
    <!-- Optionally add the featured image for the post here -->
    <img itemprop="thumbnailUrl" src="http://link.to/post-thumbnail.png" alt="Featured Image">

    <!-- To give search engines a better idea of what this article is about. we would probably use the same text as the meta description for this one unless there is a large variation. I've added it as meta so as to provide search engines with relavent data without exposing users to possibly duplicate content. If you want to use this as a byline than we would format it as an h2 or h3-->
    <meta itemprop="about" content="a quick summary of the article">

    <div itemprop="articleBody">This is the actual content of your blog</div>
  </section>
  <footer>

    <!-- I'm not sure if each tag should be in it's own keywords element, or if multiple keywords can go in one keywords element. we opted for multiple keywords elements as it makes more sense to me and gives them more meaning to seperate them -->
    <div class="tags">
      <ul>
        <li><a href="http://www.link.to/tag/1"><span itemprop="keywords">tag1</span></a></li>
        <li><a href="http://www.link.to/tag/2"><span itemprop="keywords">tag2</span></a></li>
        <li><a href="http://www.link.to/tag/3"><span itemprop="keywords">tag3</span></a></li>
        <li><a href="http://www.link.to/tag/4"><span itemprop="keywords">tag4</span></a></li>
      </ul>
    </div>

    <!-- using discussionUrl to give a link to the comments section for this page and a data element to provide a machine readable number of interactions and type of interactions, while using english to display the number of comments.-->
    <div class="socialInteractions">
      <a itemprop="discussionUrl" href="http://link.to/this/page#comments"><data     itemprop="interactionCount" value="UserComments:78">78 user comments</data></a>
    </div>

    <!-- adding an id to comments to be able to act as an anchor for the above discussionUrl -->
    <div id="comments" class="comments">
      <h3>Comments</h3>

      <!-- A comment block -->
      <article itemprop="comment" itemscope itemtype="http://schema.org/UserComments" class="comment">
        <header>
        <div class="time">posted <time itemprop="commentTime" datetime="2011-11-07T10:00Z">Today</time><div>

        <!-- instead of using just text which is valid, I'm using the person schema to also include the profile pic. -->
        <div class="author" itemprop="creator" itemscope itemtype="http://schema.org/Person">
          by <a itemprop="url" href="http://www.link.to/comment/creators/website"> 
          <img itemprop="image" src="http://www.link.to/profile/pic">
          <span itemprop="name">Comment Author</span></a>
        </div> 

        </header>

        <!-- the actual comment goes in here -->
        <section itemprop="commentText">This is a Comment!</section>
        <footer>

          <!-- Here I'm placing a reply link (using wordpress as the basis for the end of the link), and using the replyToUrl itemprop -->
          <a itemprop="replyToUrl" href="http://link.to/this/?replytocom=1#respond">Reply</a>
        </footer>
      </article>

      <form>
        Your contact form
      </form>
    </div>
  </footer>
</article>
{% endhighlight %}

## So really what's the benefit?

The benefit is that when Google takes a glance at your website, rather than seeing a bunch of unrelated stuff, it see information that it can understand and easily make sense of, and could relate with other websites. It means Google doesn't have to guess as much as to what your content is, who wrote it, what or who it's about, when it was written. The blog post above for example Google would see as

<pre>Item 
  Type: http://schema.org/blogposting
  headline = The Title Of your Post 
  author 
    text = Author 
    href = http://link.to/authors/profile
  datepublished = 2011-11-07T09:00Z 
  articlesection = Category1 
  articlesection = Category2 
  articlesection = Category3 
  articlesection = Category4 
  thumbnailurl = http://link.to/post-thumbnail.png 
  about = a quick summary of the article 
  articlebody = This is the actual content of your blog 
  keywords = tag1 
  keywords = tag2 
  keywords = tag3 
  keywords = tag4 
  discussionurl 
    text = 78 user comments 
    href = http://link.to/this/page#comments
  interactioncount = 78 user comments 
  comment = Item( 1 ) 

  Item 1 
    Type: http://schema.org/usercomments
    commenttime = 2011-11-07T10:00Z 
    creator = Item( 2 ) 
    commenttext = This is a Comment! 
    replytourl 
      text = Reply 
      href = http://link.to/this/?replytocom=1#respond

  Item 2 
    Type: http://schema.org/person
    url = http://www.link.to/comment/creators/website 
    image = http://www.link.to/profile/pic 
    name = Comment Author</pre>

Although microdata is still somewhat new and still having a few growing pains every now and then, we plan on converting this blog to microdata in the near future.