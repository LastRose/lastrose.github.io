---
layout: post
title:  "How to add a FontAwesome field in the WordPress Customizer"
permalink: how-create-fontawesome-wordpress-customizer-field
date:   2016-02-18 08:43:59
author: Last Rose Studios
categories: Programming
tags: WordPress FontAwesome
cover: "./assets/instacode.png"
---


I won't go in to the details of the WordPress customizer, you can read them over at https://codex.wordpress.org/Theme_Customization_API
This is to showcase how to create a custom control - and in this case, one that lists icons available from FontAwesome.

First step is to create the controls
{% highlight php %}
    $wp_customize->add_setting( 'your_fontawesome_icon_title',
      array(
        'default'    => 'default'   ',
        'type'       => 'type'      option',
        'capability' => 'capability edit_theme_options',
        'transport'  => 'transport' refresh',
      )
    );

    $wp_customize->add_control( new FontAwesome_Dropdown_Custom_Control( $wp_customize, 'your_fontawesome_icon_title', 
      array(
        'label'    => __( 'Your fontawesome icon title', 'your-text-domain' ),
        'section'  => 'your section',
        'settings' => 'your_fontawesome_icon_title',
        'priority' => 30,
      ) )
    );
{% endhighlight %}

Next, create the custom control

{% highlight php %}
if ( ! class_exists( 'WP_Customize_Control' ) )
  return null;

/** A class to add a fontawesome icons selector */
class FontAwesome_Dropdown_Custom_Control extends WP_Customize_Control
{

  private $icons = false;

  public function __construct( $manager, $id, $args = array(), $options = array() ) {
    $this->icons = $this->get_icons();
    parent::__construct( $manager, $id, $args );
  }

  /**
   * Render the content of the dropdown
   *
   * Adding the font-family styling to the select so that the font renders 
   * @return HTML
   */
  public function render_content() {
    if ( ! empty( $this->icons ) ) { ?>
      <label>
        <span class="customize-category-select-control"><?php echo esc_html( $this->label ); ?></span>
        <select <?php $this->link(); ?> style="font-family: 'FontAwesome', Arial;">
          <?php
            foreach ( $this->icons as $k=>$v ) {
              printf('<option value="%s" %s>%s</option>', $k, selected($this->value(), $k, false), $v);
            }
          ?>
        </select>
      </label>
    <?php }
  }

  /** 
   * Get the list of Icons 
   *
   * @return string
   */
  function get_icons() {
    /* populate with a list of icons you want to show */
	  $icons = array(
	    "fa-500px" => "500px &#xf26e;",
	    "fa-adjust" => "adjust &#xf042;",
	    "fa-adn" => "adn &#xf170;",
	    "fa-align-center" => "align-center &#xf037;",
	    "fa-align-justify" => "align-justify &#xf039;",
        // ...
	    "fa-yelp" => "yelp &#xf1e9;",
	    "fa-yen" => "yen &#xf157;",
	    "fa-youtube" => "youtube &#xf167;",
	    "fa-youtube-play" => "youtube-play &#xf16a;",
	    "fa-youtube-square" => "youtube-square &#xf166;",
	  );
		return $icons;
	}
}
{% endhighlight %}

With that done, when you go into the customizer, you should now see a field with FontAwesome icons. 