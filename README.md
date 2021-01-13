# Saturn'd Earth - Backend API in Rails


insert gif here with demo of how site works

[![Build Status](https://travis-ci.org/Saturnd-Earth/se-be.svg?branch=main)](https://travis-ci.org/github/Saturnd-Earth/se-be)

### Jump To
- [About](#about)
- [Contributors](#contributors)
- [Setup](#setup)
- [CLI Commands](#cli-commands)
- [Testing](#testing)
- [Database Schema](#database-schema)
- [Endpoint Documentation](#endpoint-documentation)
  - [Users](#users)
  - [Posts](#posts)
  - [Likes](#likes)
- [Technologies](#technologies)
- [Roadmap](#roadmap)

## About


This repo is the back-end service for Saturn'd Earth and is consumed by our front-end application. The front-end GitHub repo can be found [here](https://github.com/Saturnd-Earth/se-fe) and the deployed site [here](insert FE link).

## Contributors
- Back-End Team:
  - Alex Desjardins | [GitHub](https://github.com/moosehandlr) | [LinkedIn](https://www.linkedin.com/in/alex-desjardins-59297b8b/) | ardesjardins91@gmail.com
  - Garret Gerdsen | [GitHub](https://github.com/ggerdsen) | [LinkedIn](https://www.linkedin.com/in/ggerdsen/) | garrett.gerdsen@gmail.com
  - Drew Williams | [GitHub](https://github.com/drewwilliams5280) | [LinkedIn](https://www.linkedin.com/in/drewwilliams5280/) |
- Front-End Team:
  - Matthew Lane | [GitHub](https://github.com/GreyMatteOr) | [LinkedIn](https://www.linkedin.com/in/themplane/) |
  - Michael Walker | [GitHub](https://github.com/MichaelEWalker87) | [LinkedIn](https://www.linkedin.com/in/michael-walker-719471141/) |
  - Chris Castanuela | [GitHub](https://github.com/Chriscastanuela) | [LinkedIn](https://www.linkedin.com/in/christopher-castanuela/) |

## Setup
- Rails setup instructions. Maybe include link on how to set up environment.
- Clone repo: `git clone git@github.com:Saturnd-Earth/se-be.git`
- Virtual Environment Setup:
- Install gems:
- Set up local databases
  ```shell
  # creates your dev database
  # creates your test database
  # connects you to your dev database in order to run the following commands
  # generates new migration files from any changes made to models.py
  # runs migrations on your dev database
  # seed data in dev database
  # connects you to your test database in order to run the following commands
  # runs migrations on your test database
  ```
- `rails s` to run server on `localhost:3000`

## CLI commands
- `$ rails db:{drop,create,migrate,seed}` drops all tables, creates all tables, and seeds whichever database is currently set to `DATABASE_URL` environment variable.

## Testing
- Run tests with coverage report: `bundle exec rspec`
  - See browser-based coverage report
    ```
    coverage report command here
    ```

## Database Schema
![image]()

## Endpoint Documentation
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/c6bb506040a84336a8e8)
###### Base URL: Use `localhost:3000` to explore endpoints with local server and `be-saturnd-earth.herokuapp.com/` to explore the endpoints via the live Heroku app

### Users
###### Request:
```
query {
    users{
        id,
        username
    }
}
```
###### Response: Returns all users
  ```JSON
  {
    "data": {
        "users": [
            {
                "id": "19",
                "username": "nicolas.boyle@harvey-mcglynn.biz"
            },
            {
                "id": "20",
                "username": "vannesa@fay.io"
            },
            {
                "id": "21",
                "username": "grady.hegmann@kohler.co"
            },
            {
                "id": "22",
                "username": "deborah@shields.org"
            },
            {
                "id": "23",
                "username": "deann@schamberger-kreiger.name"
            }
        ]
    }
}
  ```

#### User
###### Request:
```
query(id: 19) {
    users{
        id,
        username
    }
}
```
###### Response: Returns username and user id
  ```JSON
  {
    "data": {
        "user": {
            "id": "19",
            "username": "nicolas.boyle@harvey-mcglynn.biz"
        }
    }
}
  ```

### Posts
###### Request: query
###### Response:


### Likes
###### Request: query
###### Response:

## Technologies
- Ruby
- Rails
- GraphQL
- PostgreSQL
- RSpec
- TravisCI

## Roadmap
