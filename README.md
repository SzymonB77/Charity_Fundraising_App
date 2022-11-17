# Charity Fundraising App

**Charity Fundraising App** is a REST API only aplication using **Ruby on Rails** and **PostgreSQL**. It is an application for managing online fundraisers for any charity purpose .
The application is modeled on polish sites offering the possibility to create fundraisers such as zrzutka.pl or się pomaga.pl

The application is still under development.

For now, only the ability to create an extended user model and a base collection model has been implemented. 


## Installing

### Getting started

Dependencies
To run this project you need to have:

Ruby 2.7.4

Rails 6.1.7

PostgreSQL 13.8

### Setup the project
Clone the project:
``` bash
  $ git clone https://github.com/SzymonB77/Charity_Fundraising_App
```

Enter project folder:
``` bash
  $ cd To_do_json
```

Next, configure your local database in config/database.yml file. Add your database username and password (unless you don't have any).

Install the gems:
``` bash
  $ bundle install
```

Create and seed the database:
``` bash
  $ rails db:create 
  $ rails db:migrate 
  $ rails db:seed
```

### Running the project

Run Rails server:
```bash
$ rails server
```
Open http://localhost:3000
