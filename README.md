# Charity Fundraising App

**Charity Fundraising App** is a REST API only aplication using **Ruby on Rails** and **PostgreSQL**. It is an application for managing online fundraisers for any charity purpose .
The application is modeled on polish sites offering the possibility to create fundraisers such as zrzutka.pl or się pomaga.pl. App created to improve my code writing skills.

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

`/fundraisers/:id` - single fundraiser with photos, updates, creator of the fundraiser, associated donations and money boxes:
```json
{
    "id": 1,
    "title": "Young father suffers from stomach cancer",
    "name": "Harry",
    "surname": "Callahan",
    "reason": "stomach cancer",
    "city": "Kraków",
    "region": "Małopolskie",
    "end_date": null,
    "discription": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "total_amount": "300.0",
    "number_of_views": 4,
    "donations": [
        {
            "id": 5,
            "amount": "100.0",
            "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "username": {
                "full_name": "James Conay "
            },
            "sent": "2023-01-08 23:14",
            "money_box_id": 12
        },
        {
            "id": 43,
            "amount": "200.0",
            "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "username": "anonymous",
            "sent": "2023-01-08 23:23",
            "money_box_id": null
        }
    ],
    "show_photos": [
        {
            "id": 1,
            "photo": "photo_url_1",
            "fundraiser_id": 1,
            "created_at": "2023-01-08 23:16"
        },
        {
            "id": 2,
            "photo": "photo_url_2",
            "fundraiser_id": 1,
            "created_at": "2023-01-08 23:16"
        },
 
    ],
    "fundraiser_updates": [
        {
            "id": 1,
            "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "fundraiser_id": 1,
            "update_from": "2023-01-08 23:17"
        },
        {
            "id": 2,
            "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "fundraiser_id": 1,
            "update_from": "2023-01-08 23:17"
        },

    ],
    "creator_of_the_fundraiser": {
        "id": 1,
        "full_name": "Mary Callahan"
    },
    "money_boxes": [
        {
            "id": 12,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "sum_of_money_box_donations": "100.0",
            "total_unique_donators": 1,
            "user": {
                "id": 2,
                "full_name": "Tommy Vercetti"
            }
        }
    ]
}
```

`/fundraisers/:id/money_boxes/:id` - single money box with associated donations:
```json
{
    "id": 1,
    "title": "My money box for a worthy cause",
    "notification": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    "qrcode" "qrcode_url_1": ,
    "fundraiser_id": 8,
    "user_id": 1,
    "sum_of_money_box_donations": "50.0",
    "total_unique_donators": 1,
    "sum_of_fundraiser_donations": "1399.0",
    "user": {
        "full_name": "John "
    },
    "donations": [
        {
            "id": 81,
            "amount": "25.0",
            "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "username": {
                "full_name": "Jack Ryan "
            },
            "sent": "2023-01-09 23:09",
        },
        {
            "id": 82,
            "amount": "25.0",
            "note": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "username": {
                "full_name": "Daniel Craig "
            },
            "sent": "2023-01-09 23:09",
        }
    ]
}
```

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
