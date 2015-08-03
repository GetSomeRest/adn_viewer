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

## Usage

The following functions are provided as of now to facilitate encorprating the viewer and uploading in your app. The documentation, logic and path for usage follows closely with the [Quick Start Tutorail](http://developer.api.autodesk.com/documentation/v1/vs_quick_start.html).
Please pass all parameters as strings. You get the key and secret when you register for an account on developer.autodesk.com and create an app. The name parameter is just a unique bucket name that you would like to give your bucket to store models in. URNs are base64 encoded strings that allow access to translated models, ready for viewing. Sample parameters:
```
key: 'y9mJIhH1eO4PZLCAVHS7qlv1EYveJqLi'
secret: 'WWPE4atWHynFb8yF'
name: 'bucketname'
urn: 'dXJuOmFkc2sub2JqZWN0czpvcy5vYmplY3Q6dGVzdHN0YWdlL1Rlc3QuZHdn'
```


Getting an access token (required for any call to the server):
```
Adn_Viewer.token(key, secret)
```
Sample success response: 
```
{
  "token_type" : "Bearer",
  "expires_in" : 1799,
  "access_token" : "GX6OONHlQ9qoVaCSmBqJvqPFUT5i"
}
```
Creating a bucket (required to store a model):
```
Adn_Viewer.create_bucket(token, name, policy)
```
Sample success response: 
```
{
    "key" : "mybucket",
    "owner" : "obQDn8P0GanGFQha4ngKKVWcxwyvFAGE",
    "createDate" : 1401735235495,
    "permissions" : [{
                "serviceId" : "obQDn8P0GanGFQha4ngKKVWcxwyvFAGE",
                "access" :  "full"
          }
    ],
    "policyKey" : "transient"
}
```



--------

## License

This sample is licensed under the terms of the [MIT License](http://opensource.org/licenses/MIT). Please see the [LICENSE](LICENSE) file for full details.


## Written by

Pratham Makhni Alag (Autodesk Developer Network)<br />
http://www.autodesk.com/adn<br />
