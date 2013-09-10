WebsiteManagement
=================
[![Build Status](https://travis-ci.org/teamaker/WebsiteManagement.png)](https://travis-ci.org/teamaker/WebsiteManagement)

Container Web Application to host static websites and allow individual users access to them.
## Background

My brother designs and styles static websites. He asked me to develop a simple web application where he could host the current state of his work and grant his clients access to it.

## Install
```shell
git clone git://github.com/teamaker/WebsiteManagement.git
cd WebsiteManagement
bundle install
rake db:migrate
rails server
```
Now navigate to the admin interface (=> /admin) and log in as admin with email `admin@example.com` and password `initial0`

Change your password!

## Workflow

#### Create and notify a user

1. Log in as admin and visit the admin interface
2. Go to the users page and create a user - a mail with username and random password will be send to the user's email address

#### Create and assign a website

1. Zip some static html content (at least a file "index.html")
2. Log in as admin and visit the admin interface
3. Go to the websites page, create a website for your client and upload the .zip archive
4. Now your client can visit your static website

Every user has his own profile page. Clients can navigate to their associated websites and admins have access to all user profiles and static websites.

## Tests

##### Run unit tests:

    rake spec

##### Run integration tests:

    rake cucumber:all
