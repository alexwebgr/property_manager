# Property manager

## The mission
Create an app to manage properties with an area autocomplete feature

## The approach
Created a basic rails app with a touch of javascript. Assuming there is a frontend framework used, I focused more on the rails / ruby side of things. 

### The stack
* Ruby 2.7.0
* Rails 6.1.0
* Bootstrap 4.4.1
* jQuery 3.4.1
* postgres 12.5.0

### The test stack
* Rspec
* factory_bot
* simplecov
* webmock

## Installation
### Run locally 
* make sure you have the correct version of ruby installed, i use [rbenv](https://github.com/rbenv/rbenv) that allows me to have
multiple versions of ruby installed without hijacking my shell session.
   
* Also make sure you have postgresql installed and configured. You can find the database credentials in the `config/credentials/<env>.yml.enc` file
   
* To unlock the encrypted credentials you will need to have the corresponding .key file sitting next to them along with
the `config/master.key` present in your config folder

* run `bundle install` to install the dependencies
* run `rails db:create` to create the databases
* run `rails db:schema:load` to import the db schema
* run `rails db:seed` to create a user and the transaction_types like rent, buy and so on
* run `rails s` to start the app

### Run the tests
Assuming all the setup is done as described in the previous section you will need to run `rspec` or `bundle exec rake`
at the root folder of the project.
A coverage report should be generated under `coverage/index.html` 

## Usage
Assuming the setup was successful and the server is running navigate to http://localhost:3000, 
you should be able see a list of users with a login link next to them. This is just a way to imitate authentication.
You can also add new users.

Clicking in any of them will take you to a list of properties created by that user, click the button **New Property** to add a new one.

Clicking on the brand name, Property manager, will take you to the list of users 
to select a different one and add properties under their account.

## Features
* encrypted credentials
* webpacker
* _.debounce from lodash in order to delay multiple consecutive server requests in the area field of the property form

## Things missing
* Proper authentication, a login / register flow
* Proper authorization not all users should be able to add new users or transaction types
* Acceptance or end-to-end tests, i would use capybara with rspec but the setup and configuration takes a long time.
* testing model relations like `has_many` since currently there are only tests for field validations, 
  for that i would use shoulda-mathcers despite having a controversial name it was created and is maintained by thoughtbot
  a digital agency that has produced numerous remarkable gems and has undoubtedly influenced the way we write and test code.
* In a real-life scenario there is probably a frontend framework being used like react or vue which has their own test suite as well.
* making form validation more user-friendly and by not navigating away and adding the error messages next to the respective field. 
  jquery-validate would be probably the way to go on this one.
  
* an activity indicator for area field to let the user know that a request is in progress
* a different way of serving the results from the area endpoint, for example with server-side rendering from a rails controller
that ready ready-made html ready to attached to a DOM element. 

