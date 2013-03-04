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

Now navigate to the admin interface (=> /admin) and log in with username "admin" and password "initial0".

Change your password!

## Workflow

1. Zip some static html content (at least a file "index.html")
2. Log in as admin and visit the admin interface
3. Create a website for your client and upload the .zip archive
4. Now your client can visit your static website!

Every user has his own profile page. Clients can navigate to their associated websites and admins have access to all user profiles and static websites.

**Attention!**
The zip file must contain the .html files itself, no parent folder is allowed!

<pre><code>
    Example:
        myWebsite.zip
         |- index.html
         |- about.html
         |- contact.html
</code></pre>


## Test

##### Run unit tests:

    rake spec

##### Run integration tests:

    rake cucumber:all
