WebsiteManagement
=================
## Background

My brother who designs and styles static websites asked me: "Is it possible to have a simple parent web application where I can host the current state of my work and grant my clients access to their dedicated websites?"

I said: "Sure it's possible. I will try to create such a web application with _Ruby on Rails_"

And this is my solution to it.

## Install

    git clone git://github.com/teamaker/WebsiteManagement.git
    rake db:migrate
    rails server

Now navigate to the admin interface (=> /admin) and log in with username "admin" and password "initial0". Change your password!

## Workflow

1. (Manual Work) Place a static html folder under "app/views/websites/"
2. Log in as admin an visit the admin interface
3. Create a website resource for a certain client and type in a folder attribute that matches the corresponding folder from step 1.
4. Now your client has access to your static website!

Every user has his own profile page. Clients can navigate to their associated websites and admins can see all websites.

## Test

##### Run unit tests:

    rake spec

##### Run integration tests:

    rake cucumber:all
