This sample is obsolete and not maintained



# adn_viewer gem

[![Ruby](https://img.shields.io/badge/Ruby-%3E%3D%20v2.0.0-red.svg)](https://www.ruby-lang.org/en/)
[![Gem](https://img.shields.io/badge/Stable_Gem-v1.0.2-orange.svg)](https://rubygems.org/gems/adn_viewer)
[![LMV](https://img.shields.io/badge/View%20%26%20Data%20API-v1.2.15-brightgreen.svg)](http://developer-autodesk.github.io/)
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

This is a gem that lets you incorporate the API in your own Ruby script or Ruby on Rails app. All functions required to get a viewer up and running are provided and documented.


## Description

The adn_viewer gem allows authentication, bucket creation, checking, uploading files, registering for viewing and more. You can use the gem to setup an RoR app that requires integration of viewing, uploading, etc. of 3D models in a light weight javascript viewer.

It closely follows the steps described in the documentation:

* http://developer.api.autodesk.com/documentation/v1/vs_quick_start.html

In order to make use of this sample, you need to register your consumer key:

* https://developer.autodesk.com > My Apps

This provides the credentials to supply to the http requests on the Autodesk server.


## Dependencies and Setup

To know how to setup a simple rails app using this gem (including installing rails), visit [adn_viewer_gem_test_app tutorial](https://github.com/prathamalag1994/adn_viewer_gem_test_app).

Add this to your Gemfile to install the adn_viewer gem:
```
gem 'adn_viewer'
```
Now, add the following to your Gemfile to install dependencies:
```
gem 'curb-fu'
gem 'curb'
gem 'gon'
gem 'json'
```

Finally, run ```bundle install``` to install these dependencies.

## Usage

The following functions are provided as of now to facilitate incorporating the viewer and uploading in your app. The documentation, logic and path for usage follows closely with the [Quick Start Tutorial](http://developer.api.autodesk.com/documentation/v1/vs_quick_start.html).
Please pass all parameters as strings. You get the key and secret when you register for an account on developer.autodesk.com and create an app. The name parameter is just a unique bucket name that you would like to give your bucket to store models in. URNs are base64 encoded strings that allow access to translated models, ready for viewing. Finally, all sample success responses are actually parsed and provided as readily usable JSON responses. Sample parameters:

```
key: 'y9mJIhH1eO4PZLCAVHS7qlv1EYveJqLi'
secret: 'WWPE4atWHynFb8yF'
name: 'bucketname'
urn: 'dXJuOmFkc2sub2JqZWN0czpvcy5vYmplY3Q6dGVzdHN0YWdlL1Rlc3QuZHdn'
filename: "Test.dwg"
filepath: "#{Rails.root}/public/Test.dwg"
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
Also, for the 3 types of polices available, read this: [bucket policies.](http://adndevblog.typepad.com/cloud_and_mobile/2015/01/buckets-in-autodesk-view-and-data-api.html) <br />
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
Getting bucket details:
```
Adn_Viewer.check_bucket(token, name)
```
Sample success response: Same as create_bucket

Getting a list of formats supported by the viewer (for pre-validification of uploaded files):
```
Adn_Viewer.supported_formats(token)
```
Sample success response:
```
"extensions" : ["ipt", "neu", "stla", "stl", "xlsx", "jt", "jpg", "skp", "prt", "dwf", "xls", "png", "sldasm",
      "step", "dwg", "zip", "nwc", "model", "sim", "stp", "ste", "f3d", "pdf", "iges", "dwt", "catproduct",
      "csv", "igs", "sldprt", "cgr", "lll", "3dm", "sab", "obj", "pptx", "cam360", "jpeg", "bmp", "exp",
      "ppt", "doc", "wire", "ige", "rcp", "txt", "dae", "x_b", "3ds", "rtf", "rvt", "g", "sim360", "iam",
      "asm", "dlv3", "x_t", "pps", "session", "xas", "xpr", "docx", "catpart", "stlb", "tiff", "nwd",
      "sat", "fbx", "smb", "smt", "dwfx", "tif"]
```
Uploading a file:
```
Adn_Viewer.upload_file(token, bucket_name, filename, filepath)
```
Sample success response:
```
{
  "bucket-key": "mybucket",
  "objects": [
      {
          "location": "https://developer.api.autodesk.com/oss/v1/buckets/mybucket/objects/skyscpr1.3ds",
          "size": 308331,
          "key": "skyscpr1.3ds",
          "id": "urn:adsk.objects:os.object:mybucket/skyscpr1.3ds",
          "sha-1": "e84021849a9f5d1842bf792bbcbc6445c280e15b",
          "content-type": "application/octet-stream"
      }
  ]
}
```
IMPORTANT: If you're uploading from a link and not from a file on your machine, you must also install the dependency gem 'nokogiri' in the Gemfile and doing bundle install. Finally, pass your filesize in bytes to your upload_file function too. Note: all of this is only required to upload file from a website, not from your own machine.
Sample code for such a call after putting ```gem 'nokogiri'``` in your gem and doing bundle install:
```
filename = "eg.dwg"
filepath = "http://eg/eg.dwg"
filesize = 2199482
Adn_Viewer.upload_file(token, bucket_name, filename, filepath, filesize)
```
Please note that you need that the JSON returned has to be parsed properly in order to get the urn out.
The id feild you get for an uploaded file must be considered a hash and stripped of unnecessary characters:
```
urn = Adn_Viewer.upload_file(token, name, filename, filepath)["objects"][0].first.to_s		#upload the file you want to view
urn = urn[8...-2]    #formats the urn correctly
```
In order to procede, this urn retrieved from the id feild of an upload call needs to be base64 encoded to get the final usable urn by:
```
urn = Base64.urlsafe_encode64(urn)
```
Register your uploaded file for translation:
```
Adn_Viewer.register(token, urn)
```
Sample success response:
```
{"Result"=>"Created"}
       OR
{"Result"=>"Success"}
```

Here is a simple documented ruby on rails app built using this gem: [adn_viewer_gem_test_app](https://github.com/prathamalag1994/adn_viewer_gem_test_app). The tutorial in this repo is highly recommended for all Ruby developers using this gem.

A more complex app built incorporating the API: [sample-ruby-on-rails-app-prototyping](https://github.com/Developer-Autodesk/sample-ruby-on-rails-app-prototyping)

--------

## License

This sample is licensed under the terms of the [MIT License](http://opensource.org/licenses/MIT). Please see the [LICENSE](LICENSE) file for full details.


## Written by

Pratham Makhni Alag (Autodesk Developer Network)<br />
http://www.autodesk.com/adn<br />


For troubleshooting, visit forums.autodesk.com and post with reference to the view and data api.
