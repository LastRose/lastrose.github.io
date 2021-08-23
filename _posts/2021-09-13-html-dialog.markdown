---
layout: post
title:  "Dialog, the New Native HTML Modal"
permalink: /html-dialog
date:   2021-09-13 7:14:00
author: Last Rose Studios
categories: Programming
tags: HTML JS
cover: "./assets/instacode.png"
---

## HTML Dialog Element

The JS alert is being depricated, but not to fear, HTML has a native dialog element that is triggered with javascript. 

to use it 
```html
<button id="dialog-open">Open Dialog</button>
<dialog>
  <h2>This is a dialog</h2>
  <p>Dialog Element</p>
  <button id="dialog-close">Close Dialog</button>
</dialog>
```
```js
const dialog = document.querySelector('dialog');
const open = document.querySelector('#dialog-open');
const close = document.querySelector('#dialog-close');

open.addEventListener( 'click', e => dialog.showModal() );
close.addEventListener( 'click', e=> dialog.close() );
```
<iframe width="100%" height="300" src="//jsfiddle.net/lastrose/chxf1rao/embedded/result/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

and that's it. Out of the box Chrome applies some basic styles to the dialog box, and would imagine other browsers would implement their own styling as well (A new reset needed?). You can set your own styling to it though, and can style the backdrop as well using `dialog::backdrop{}`. 

Support for the `<dialog>` element is limited right now https://caniuse.com/?search=dialog with no support on Firefox (available behind a flag) or Safari.

Note that it can also be opened by CSS, however in our testing all we could do was overwrite the default value for the dialogs display, not open it properly. 

In theory you could write your own styles to overwrite the browser ones, but it is probably safer to just stick with javascript to trigger it.