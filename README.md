# adn_viewer gem

[![Ruby](https://img.shields.io/badge/Ruby%20Version-%3E%3D%202.0.0-red.svg)](https://www.ruby-lang.org/en/)
[![Gem](https://img.shields.io/badge/Gem-1.0.0-orange.svg)](https://rubygems.org/gems/adn_viewer)
[![LMV](https://img.shields.io/badge/View%20%26%20Data%20API-v1.2.15-green.svg)](http://developer-autodesk.github.io/)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://opensource.org/licenses/MIT)


<b>Note:</b> For using this sample, you need a valid oAuth credential for the translation / extraction portion.
Visit this [page](https://developer.autodesk.com) for instructions to get on-board.


## Links
[Ruby Gem adn_viewer](https://rubygems.org/gems/adn_viewer) <br />
[ADN website](https://developer.autodesk.com/) <br />
[How the API Works and sample code](https://developer.autodesk.com/api/view-and-data-api/) <br />
[Live Sample](http://developer-autodesk.github.io/LmvQuickStart/) <br />

## Motivation

Our View and Data API Beta adds powerful 2D and 3D viewing functionality to your web apps.
Our REST and JavaScript API makes it easier to create applications that can view, zoom and interact with 2D and
3D models from over 60+ model formats with just a web browser, no plugin required!

This is a gem that lets you encorporate the API in your own Ruby script or Ruby on Rails app. All functions required to get a viewer up and running are provded and documented.


## Description

The adn_viewer gem allows authentication, bucket creation, checking, uploading files, registering for viewing and more. You can use the gem to setup an RoR app that requires integration of viewing, uploading, etc. of 3D models in a light weight javascript viewer. 

It closely follows the steps described in the documentation:

* http://developer.api.autodesk.com/documentation/v1/vs_quick_start.html

In order to make use of this sample, you need to register your consumer key:

* https://developer.autodesk.com > My Apps

This provides the credentials to supply to the http requests on the Autodesk server.


## Dependencies and Setup

Add this to your gemfile to install the adn_viewer gem:
```
gem 'adn_viewer'
```

Now, add the following to your gemfile to install dependencies:
```
gem 'curb-fu'
gem 'curb'
gem 'gon'
gem 'json'
```

Finally, run bundle-install to install these dependencies.

--------

## License

This sample is licensed under the terms of the [MIT License](http://opensource.org/licenses/MIT). Please see the [LICENSE](LICENSE) file for full details.


## Written by

Pratham Makhni Alag (Autodesk Developer Network)<br />
http://www.autodesk.com/adn<br />
