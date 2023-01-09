# Charity Fundraising App

**Charity Fundraising App** is a REST API only aplication using **Ruby on Rails** and **PostgreSQL**. It is an application for managing online fundraisers for any charity purpose .
The application is modeled on polish sites offering the possibility to create fundraisers such as zrzutka.pl or się pomaga.pl

### Features include:
- The ability for multiple users to create profiles with customizable settings
- Allowing users to add multiple debit cards to their account
- The option for users to add a identity card for account confirmation purposes
- The ability for companies to receive invoices
- Users have the option to create their own fundraisers and send updates through a separate model
- Users can create their own money boxes linked to a specific fundraiser they wish to collect donations for
- Users can send donations to specific fundraisers or money boxes linked to fundraisers
- The ability to add fundraisers to a list of watched fundraisers
- Any user can report a violation by a fundraiser to the administrator

## Entity Relationship Diagram (ERD)
In the link below you will find the ER diagram of the data base designed for this application. 
https://dbdiagram.io/d/63a4520f99cb1f3b55a30128

## Examples of API responses
Below are examples of responses from endpoints.
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
git clone https://github.com/SzymonB77/Charity_Fundraising_App
```

Enter project folder:
``` bash
cd Charity_Fundraising_App
```

Next, configure your local database in config/database.yml file. Add your database username and password (unless you don't have any).

Install the gems:
``` bash
bundle install
```

Create and seed the database:
``` bash
rails db:create 
rails db:migrate
rails db:seed
```

### Running the project

Run Rails server:
```bash
rails server
```
Open http://localhost:3000
