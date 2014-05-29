APIserver
=========

rails api server



Brief Intro
===========

Router: using namespace and subdomain

Model:  one to many relationship

Async job: resque

Validation: add_index for database level uniquness alone with validation in Model

CRUD: functionality with status code

Format: Considering extension, use `respond_to` to support multiple request format, is you want to 
test `get` in browser, don't forget to add `.json`, like `http://api.x.com:3000/accounts.json`



Commit message
==============

Using the project's commit message, you can know the procedure of its development



ENV Setting
===========

Postgres
--------

I've create a github gist, so follow it, the [link](https://gist.github.com/Daniel-Xu/315719120a53e4cbaa6b)

Make sure you run the postgres and `rake db:setup` to create database

Redis
-----

Redis is for resque, the async gem, so the gist is [here](https://gist.github.com/Daniel-Xu/ac062c5881f6f8800b48)

Local host
----------

add configuration to your /etc/hosts
    
    127.0.0.1 x.com
    127.0.0.1 api.x.com

So when you are testing, using `http://api.x.com:3000/` in your browser

Start project
-------------

First, make sure you have the right version of ruby and rails
ruby: 2.1.1,  rails 4.1.1

Then,  `rake resque:work QUEUE='*'` to start resque woker

Finally, `rails s` to start the server

open `http://api.x.com:3000/`, and you are ready to test



How to Test
===========

Basically, I use `curl` to test the API

Post
-----
    `-X` specify the protocol, and `-d` specify the data

    curl -i -X POST -d 'account[name]=hello' http://api.x.com:3000/accounts

Update
------
    
you should change the id according to your situation 

    curl -i -X PATCH -d "account[name]=ye" http://api.x.com:3000/accounts/14

    curl -i -X PATCH -d "domain[hostname]=www.baidu.com" http://api.x.com:3000/domains/10

Index
-----

    curl http://api.x.com:3000/accounts

    curl http://api.x.com:3000/domains

Show
----

    curl http://api.x.com:3000/domains/10

Delete
------

    curl -i -X DELETE http://api.x.com:3000/accounts/15

    curl -i -X DELETE http://api.x.com:3000/domains/10

Async 
------
Remember to run  `rake resque:work QUEUE='*'` before testing

    curl -i -X PATCH -d "hostname=c&ip=hello" http://api.x.com:3000/domains/search


Trello
======

The assignment's public trello is  [Here](https://trello.com/b/L2psYQHl/api-server)
