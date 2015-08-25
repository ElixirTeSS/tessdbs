# Overview

This project contains two basic rails apps which contain no more than a Workflow model which holds a name and JSON blob. There are two scripts, one to load a JSON record and the other to query it by the ID of one of the nodes. In production that ID would be, I presume, the BSON or integer ID of a Material record within TeSS.

First:

1. rvm install ruby-2.2-head
2. rvm use --create ruby-2.2-head@tessdbs 

##  Mongodb

1. Install mongodb with default settings (127.0.0.1:27017, no security).
2. Handy mongoid tutorial: http://railscasts.com/episodes/238-mongoid?view=asciicast
  * gem install bundler
  * gem install rails
  * Use mongoid gem from git if rails generator fails: https://github.com/mongodb/mongoid.git
    At this point it may be necessary to do a bundle update.
  * rails new mongo -O (blows up if active_record is present).
  * Add mongo and bson gems to Gemfile, bundle install.
  * rails g mongoid:config.
3. Create the model: rails g scaffold workflow name:string content
4. Generate a workflow entr(y|ies) by running: rails runner test_create.rb
5. Search in workflows by running: rails runner test_search.rb



## PostgreSQL


1. Install postgres and add a user:
  * create database tess_development;
  * create user tess password 'training';
  * grant all on tess_development to tess;
  * ...should now be able to connect with 'psql -U tess -W -d tess_development'
2. Handy postgres/rails tutorial: https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04 
3. Edit config/database.yml to add the user and password defined above.
4. Create the model: rails g scaffold workflow name:string content:json 
5. Run rake db:migrate
6. Generate a workflow entr(y|ies) by running: rails runner test_create.rb
7. Search in workflows by running: rails runner test_search.rb



