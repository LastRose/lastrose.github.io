---
layout: post
title:  "Metaweblog API in codeignitor using XMLRPC"
permalink: metaweblog-api-codeignitor-xmlrpc
date:   2011-09-27 08:43:59
author: Last Rose Studios
categories: Programming
tags: CodeIgniter PHP Tutorial
cover: "./assets/instacode.png"
---

Originally this blog was built in codeignitor, however I decided to switch it up to wordpress for practice. During the construction of the original I decided that I wanted to handle different blogging software, and so I researched the metaweblog API and built it into codeignitor. Below is a base I made that was originally going to be for a video tutorial. I suck at video tutorials though, and the video was awful. The prep work left me with the well commented code below. I hope it can help someone out. You can see the code implemented with a database at [https://github.com/LastRose/MetaWeblog-API-for-CodeIgnitor](https://github.com/LastRose/MetaWeblog-API-for-CodeIgnitor). If you're interested in the sites I used as a reference, take a look at  [http://blogs.technet.com/b/larsnakkerud/metablog.ashx](http://blogs.technet.com/b/larsnakkerud/metablog.ashx),  [http://www.xmlrpc.com/metaWeblogApi](http://www.xmlrpc.com/metaWeblogApi) and [http://ellislab.com/codeigniter/user-guide/libraries/xmlrpc.html](http://ellislab.com/codeigniter/user-guide/libraries/xmlrpc.html). You can also take a look at the [wordpress xmlrpc file](http://core.svn.wordpress.org/trunk/xmlrpc.php)

{% highlight php %}
<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
$URL = '';
class Xmlrpcs extends CI_Controller {

    function __construct() {
        parent::__construct();
    }

    function index() {
        $config['functions']['blogger.getUserInfo'] = array('function' => 'xmlrpcs.getUserInfo');
        $config['functions']['blogger.getUsersBlogs'] = array('function' => 'xmlrpcs.getUsersBlog');
        $config['functions']['blogger.deletePost'] = array('function' => 'xmlrpcs.deletePost');
        $config['functions']['metaWeblog.newPost'] = array('function' => 'xmlrpcs.newPost');
        $config['functions']['metaWeblog.editPost'] = array('function' => 'xmlrpcs.editPost');
        $config['functions']['metaWeblog.getPost'] = array('function' => 'xmlrpcs.getPost');
        $config['functions']['metaWeblog.getCategories'] = array('function' => 'xmlrpcs.getCategories');
        $config['functions']['metaWeblog.getRecentPosts'] = array('function' => 'xmlrpcs.getRecentPosts');
        $config['functions']['metaWeblog.newMediaObject'] = array('function' => 'xmlrpcs.newMediaObject');
        $config['object'] = $this;
        $this->xmlrpcs->initialize($config);
        $this->xmlrpcs->serve();
    }

    function login($username, $password) {
        /*normally this function would check the database for a valid user, and see if the password matches,*/
        $u = 'user';
        $p = 'pass';
        if ($u == $username AND $p == $password) {
            return true;
        }
        return false;
    }

  /*A function used to debug various things.*/
    function debug() {
        $server_url = site_url('xmlrpcs');
        $this->xmlrpc->set_debug(TRUE);
        $this->xmlrpc->server($server_url, 80);
        $this->xmlrpc->method('metaWeblog.newMediaObject');

        $request = array(
            '123',
            'user',
            'pass',
            array(
                array(
                    'name' => 'image.gif',
                    'bits' => 'R0lGODlhDwAPAKECAAAAzMzM/////
wAAACwAAAAADwAPAAACIISPeQHsrZ5ModrLlN48CXF8m2iQ3YmmKqVlRtW4ML
wWACH+H09wdGltaXplZCBieSBVbGVhZCBTbWFydFNhdmVyIQAAOw=='
                ), 'struct'
            )
        );
        $this->xmlrpc->request($request);

        if (!$this->xmlrpc->send_request()) {
            echo $this->xmlrpc->display_error();
        }
        else
        {
            echo '<pre>';
            print_r($this->xmlrpc->display_response());
            echo '</pre>';
        }
    }

    function getUsersBlog($request) {
    /*this is the function that blogging softwares use to check an account, it returns a list of blogs that you have access to.
        get the information from the request and put it into a php array*/
        $parameters = $request->output_parameters();
        /*key 0 is for API KEY which is not normally used on the metaweblog platform.*/
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $response = array(
      /*the main array containing one array and the type.
            This will most often be of type struct if it is returning a single item(like getting a post)
            or type array if it is returning several (like the latest blog posts)
            in this case it will be returning an array
            normally we would be getting this information from a database*/
            array( //since this is the type array, this array will contain more arrays
                array( //this is the container array containing one array and the type.
                    array( //this is the actual element it is formatted as 'key'=>array('value','type') type can be int,string, boolean,double,dateTime.iso8601\. Most often though it will be a string
                        'url' => array(site_url(), 'string'), //this is where the blogs homepage is
                        'blogid' => array('123', 'string'), //this is an identifier for the blog, if you have more then one
                        'blogName' => array('The Blog Name', 'string'), //This is the title of the blog or blog name.
                    ), 'struct'
                ), // if there is more then one blog on the server, and if the user has access to it, list more
                array(
                    array(
                        'url' => array(site_url(), 'string'),
                        'blogid' => array('123', 'string'),
                        'blogName' => array('The Blog Name', 'string'),
                    ), 'struct'
                )
            ), 'array'
        );
        //send the information to the client.
        return $this->xmlrpc->send_response($response);

    }

    function getUserInfo($request) { //this returns more information about your user account.
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        /* this would pull information in the database matching the username
        I'm not going to go too far into what these mean, as the keys should be somewhat self explanitory. Example response below*/
        $response = array( //this is the container array containing one array and the type. since we are only returning one item, the user, it is type struct
            array( //Using the same format as before 'key'=>array('value','type')
                'nickname' => array('name', 'string'),
                'userid' => array('userid', 'string'),
                'url' => array('http://www.lastrose.com', 'string'),
                'email' => array('jsmith@yoursite.com', 'string'),
                'lastname' => array('Smith', 'string'),
                'firstname' => array('John', 'string')
            ),
            'struct'
        );
        return $this->xmlrpc->send_response($response);
    }

    function newPost($request) { //the big one, this is the function that adds new posts.
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $blogid = $parameters['0']; // this tells you what blog it will be for
        $content = $parameters['3']; //this is the actual content of the post.
        $publish = $parameters['4']; //this is a boolean value so if true then publish.
    /*Normally here we would write it to a DB along witht the time and the author
      In this case, I'm just writting to a text file.
      $content will normally have 3 items, title,description,categories
      categories is an array, if category doesn't exist, either create it, or do something else, maybe return an error.*/
        $contentarray = 'CONTENT:'; //here I'm just formating the array a little bit so that I can read it in the text file().
        foreach ($content as $key => $item) {
            $contentarray .= $key . ":" . $item . ",";
        }

        if (write_file('images/post.txt', $request)) { //this would be more likely to test that the blog was added to the db.
            $id = '123'; //this would be the insert_id that you get from your database.
            $response = array($id, 'string'); // here our array contains a value and a type of string.
            return $this->xmlrpc->send_response($response);
        }
        return $this->xmlrpc->send_error_message('1', 'Failed to Post');
    }

    function editPost($request) { //if you want to edit a post.
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $postid = $parameters['0']; // what post to edit.
        $content = $parameters['3'];
        $publish = $parameters['4'];
    /*Now again, this would normally work with a database
      In this case, I'm just overwritting the same text file.
      as before, $content will normally have 3 items, title,description, and the categories array*/
        $contentarray = 'CONTENT:';
        foreach ($content as $key => $item) {
            $contentarray .= $key . ":" . $item . ",";
        }
        if (write_file('images/post.txt', $contentarray)) {//this would be more likely to test that the blog was edited successfully.
            $response = array(true, 'boolean'); //in this case the blogging software is expecting a true or false reply
        } else {
            $response = array(false, 'boolean');
        }
        return $this->xmlrpc->send_response($response);
    }

    function getPost($request) { //here is a function to return a single post. so in our blogging platform if we want to pull up one of our blogs to edit it.
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $postid = $parameters['0'];
    /* Normally would be pulled from DB
    Expected Response */
        $response = array( //here we have our array with type. since there is only one item, it is type struct.
            array( //won't go to much into details as is is very similar to what we've seen before.
                'postid' => array($postid, 'string'),
                'dateCreated' => array('2010-12-09T10:55', 'dateTime.iso8601'), //here we are returning a date UTC date like 2010-12-09T10:55
                'title' => array('title', 'string'),
                'description' => array('description', 'string'),
                'categories' => array(array(array('category', 'string'), array('category2', 'string')), 'array'), //the categories,
                //here it is an array so our type is array, and inside the array, we have a wrapper array, containing several arrays of $value,type
                'publish' => array(true, 'boolean'),
                //I've seen extensions of this with extra fields for things like text_more, and excerpt, and so on, however the above is all that is really needed.
            ),
            'struct'
        );
        return $this->xmlrpc->send_response($response);
    }

    function getRecentPosts($request) {
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $blogid = $parameters['0']; //from which blog
        $numposts = $parameters['3']; //how many do you want. if this is blank normally we would return all of them
        /* again normally this is from the db, and only the posts that the user can access (editor or the author or whatever logic you set up)
    Expected Response */
        $response = array( //the information we are returning is almost identical to the getPost function, however since we are returning more than one,
            /*instead of an struct, we are returning type array. We need our wrapper array containing all our struct arrays*/
            array(
                array(
                    array(
                        'postid' => array('123', 'string'),
                        'dateCreated' => array('20040716T19:20:30', 'dateTime.iso8601'),
                        'title' => array('title', 'string'),
                        'description' => array('description', 'string'),
                        'categories' => array(array(array('category', 'string')), 'array'),
                        'publish' => array(true, 'boolean'),
                    ),
                    'struct'
                )
            ), 'array'
        );

        return $this->xmlrpc->send_response($response);

    }

    function getCategories($request) { //here is the function that the blogging softwares use to see all existing categories.
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        /*here would hit up our database for all our categories, or categories that the user is allowed to publish to.
        spec says it should return a struct of structs, with description, htmlUrl and rssUrl. Almost all implementions of this in blogging software uses and array of structs.
    Expected Response */
        $response = array(//since we are returning the array type, we have our main array, which contains value, type.
            array(//inside that we have a wrapper array for our category arrays, each one containing an array with the information and the type, struct.
                array(
                    array(
                        'categoryId'=>array('1'),//for compatibility specifying the categoryId
                        'title' =>array('title', 'string'),//for compatibility specifying title same as description
                        'description' => array('title', 'string'),//for compatibility specifying description same as title
                        'htmlUrl' => array(site_url(), 'string'),
                        'rssUrl'=> array(site_url(), 'string'),
                    ),
                    'struct'
                ),
            ),
            'array'
        );
        return $this->xmlrpc->send_response($response);
    }

    function newMediaObject($request) {
    //here is a very interesting function. this takes an image from a blogging platform, and saves it on the server. No need for external ftp, or anything else.
        //Unfortunately not all blogging softwares support it, so you might still need an ftp.
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['1'], $parameters['2'])) {
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $blogid = $parameters['0'];
        $file = $parameters['3']; // this is an array that has three items with the keys name,type, and bits. Name is the file name, type is the mime type, and bits is the actual media.
        $filename = $file['name'];
        $filename = substr($filename, (strrpos($filename,"/")?strrpos($filename,"/")+1:0));
        if (write_file('images/' . $filename, $file['bits'])) { // the folder is relative to your codeigniters base index.php file. very important make sure that your folder is created, and that it has the proper write permissions.
            /* Expected Response */
      $response = array(
                array(
                    'url' => array($URL.'/images/' . $filename, 'string') //here we return the link to the file that was just uploaded
                ),'struct'
            );
            return $this->xmlrpc->send_response($response);
        }
        return $this->xmlrpc->send_error_message('100', 'File Failed to Write'); // if it fails return an error message. although there is a good chance it will fail before this if it can't find the folder, permission problems.
    }

    function deletePost($request) {
    //most blogging applications don't make use of this function, however some do.
    //I've based it off the specs I've found, but I haven't been able to really test it, so I'm not sure it will work.
        //test the array, 0 is appkey, not used, 1 is postid, and user is 2, password is 3
        $parameters = $request->output_parameters();
        if (!$this->login($parameters['2'], $parameters['3'])) { //the user and password are a different key then normal.
            return $this->xmlrpc->send_error_message('100', 'Invalid Access');
        }
        $postid = $parameters['1'];
        //here is where you would delete the post.
        //I would more likely just unpublish it, however it's up to you.
        return $this->xmlrpc->send_response(array(true, 'boolean')); //here it expects a boolean value.
    }
}
{% endhighlight %}