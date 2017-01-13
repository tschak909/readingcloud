readingcloud
------------

readingcloud is a simple epub.js based reader for personal use from a web browser. You can upload unencrypted epub ebooks and be able to read them from your web browser. This application is built in Ruby on Rails, and thus needs to be installed as a Ruby on Rails application.

installing on debian based machines 
===================================

To install on debian based machines, Please run the bin/install-debian.sh script from inside readingcloud directory.

Debian by default does not install sudo, or put any users in the sudo group. Please use apt-get install sudo and add yourself to the sudo group, and log out and log back in, if needed.

installing on redhat based machines
===================================

To install on redhat based machines, Please run the bin/install-redhat.sh script from inside readingcloud directory.

using the software
==================

To run the server, you can start it in its simplest mode by typing:

  rails s -b your.ip.address.here -p whatever.port.you.select

If you do not specify an address to bind, using b, then it will bind to localhost. If you do not specify a port to bind to, it will bind to port 3000, by default.

user interface
==============

When you first approach readingcloud, it will ask you to log in, using an email address, and password. You should click Sign Up, to create one, after which it will automatically log you in.

At this point, you can use Upload Books, to upload books in epub format. You can either drag and drop your epub files onto the "Drop files here" box, or you can click on the box, to present a dialog box to select files to upload. You can upload multiple files at a time. The system will automatically parse them, grabbing the cover image, title, and other metadata automatically. Once this is done, you can click Books, and see the books that you've uploaded.

Simply selecting a row from the table, will open the book for reading. You can also type a title or author into the search box, to narrow down the number of books.

Once open for reading, you can:

* Navigate the book by either swiping left or right on mobile devices, or selecting the left or right arrow icons on either side of the visible page(s)
* Add a bookmark using the bookmark icon.
* Add an annotation
* Open the top left sidebar (using its icon) so that you can view a list of noted chapters, bookmarks, and annotations.
* Delete the book from the library, using the trashcan icon
* Close the book and return to the library with the close icon.

supported formats
=================

Right now, unencrypted epub files are supported (that report themselves as application/epub+zip MIME type), if the file has some sort of DRM (e.g. Google Play Books, or Adobe Digital Editions), you will need to remove it, before using this software.

license
=======

This software is licensed under version 3 or later of the GNU Public License. Please read COPYING for details.

author
======

This software was the result of a flurry of integration programming by Thomas Cherryhomes <thom.cherryhomes@gmail.com>

embedded software
=================

This software utilizes the following open source software modules

* EPUB.JS for reading.
* EPUB.JS Reader for reading UI.
* Hammer.js for Gestural Control
* Devise for Authentication and Authorization
* Paperclip for file management
* Dropzone.js for drag and drop multiple file uploading
* epub-parser, for EPUB metadata parsing
* bootstrap-table for the intelligent table layout used on the front page
* bootstrap for quickly making a pleasant user interface that works well on mobile and desktop devices
* Fontello font for UI icon elements
* entypo font for UI icon elements

