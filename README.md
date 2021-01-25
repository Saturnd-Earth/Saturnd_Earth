# Saturn'd Earth - Backend API in Rails


insert gif here with demo of how site works

[![Build Status](https://travis-ci.org/Saturnd-Earth/se-be.svg?branch=main)](https://travis-ci.org/github/Saturnd-Earth/se-be)
![](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Rails-5.2.4.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)

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
This repo is the back-end service for Saturn'd Earth and is consumed by our front-end application. The front-end GitHub repo can be found [here](https://github.com/Saturnd-Earth/se-fe) and the deployed site [here](https://saturnd-earth.github.io/se-fe/).

## Contributors
- Back-End Team:
  - Alex Desjardins | [GitHub](https://github.com/moosehandlr) | [LinkedIn](https://www.linkedin.com/in/alex-desjardins-59297b8b/) | ardesjardins91@gmail.com
  - Garret Gerdsen | [GitHub](https://github.com/ggerdsen) | [LinkedIn](https://www.linkedin.com/in/ggerdsen/) | garrett.gerdsen@gmail.com
  - Drew Williams | [GitHub](https://github.com/drewwilliams5280) | [LinkedIn](https://www.linkedin.com/in/drewwilliams5280/) | drewwilliams5280@gmail.com
- Front-End Team:
  - Matthew Lane | [GitHub](https://github.com/GreyMatteOr) | [LinkedIn](https://www.linkedin.com/in/themplane/) | themplane@gmail.com
  - Michael Walker | [GitHub](https://github.com/MichaelEWalker87) | [LinkedIn](https://www.linkedin.com/in/michael-walker-719471141/) | chriscastanuela@gmail.com
  - Chris Castanuela | [GitHub](https://github.com/Chriscastanuela) | [LinkedIn](https://www.linkedin.com/in/christopher-castanuela/) | Michael.E.Walker.87@gmail.com

## Setup
- Prerequisites
  - Ruby 2.5.x
  - Rails 5.2.4.4
  - GraphQL
  - PostgreSQL
- Clone repo: `git clone git@github.com:Saturnd-Earth/se-be.git`
- Virtual Environment Setup: `bundle install` then `bundle update`
- Set up local databases:
  - First, cd into cloned repo
  - `rails db:create` creates your test & dev database
  - `rails db:migrate` generates new migration files and creates schema found in app/db folder
  - `rails db:seed` seeds data in dev database
- `rails s` to run server on `localhost:3000/graphiql`

## CLI commands
- `$ rails db:{drop,create,migrate,seed}` drops database, creates new database, and seeds dev database.
- `rails c` to access ActiveRecord query interface

## Testing
- Run tests with coverage report: `bundle exec rspec`
- See browser-based coverage report: `open coverage/index.html`

## Database Schema
![Sat-Earth-Schema](https://user-images.githubusercontent.com/56651612/104521131-8e524880-55b9-11eb-8b48-da038cabf4a0.png)

## GraphQL Endpoint Documentation
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/c6bb506040a84336a8e8)   
Base URL:   
- `localhost:3000/graphiql` to explore endpoints with local server
- `be-saturnd-earth.herokuapp.com/` to explore the endpoints via the live Heroku app on Postman

### User Queries
###### All Users:
```
query {
  users{
    id,
    username
  }
}
```

###### User By ID:
```
query(id: ID) {
  users{
    id,
    username
  }
}
```

### User Mutations
###### Create User
```
mutation {
  createUser(input:{
      credentials: {
        username: "some_username",
        password: "some_password"
        }
    }
  )
  {
    user{
      id
      username
    }
  }
}
```
######Edit User
```
mutation {
  editUser(input:{
    id: ID
    username: "new_username"
    password: "new_password"
    }
  )
    {
    user{
      id
      username
    }
  }
}
```
######Destroy User
```
mutation {
  destroyUser(input:{
    id: ID
  }){
    user{
      id
      username
    }
  }
}
```

### Post Queries
###### All Posts
```
query {
  posts {
    id
    latitude
    longitude
    ringMinMax
    createdAt
    userId
    text
    url
    likers{
      id
      username
     }
    likes{
     id
     userId
     latitude
     longitude
     createdAt
     }
  }
}
```

###### Post By ID
```
query {
  post(id: ID) {
    id
    latitude
    longitude
    ringMinMax
    createdAt
    userId
    text
    url
    likers{
      id
      username
     }
    likes{
     id
     userId
     latitude
     longitude
     createdAt
     }
  }
}
```

###### Posts By User
```
query {
  postsByUser(userId: ID){
    id
    latitude
    longitude
    ringMinMax
    createdAt
    userId
    text
    url
    likes{
      id
      userId
      latitude
      longitude
      createdAt
    }
  }
}
```

### Post Mutations
###### Create Post
```
mutation {
  createPost(input:
    {
      userId: ID,
      text: "Testy testy test"
      latitude: 39.6930795
      longitude: -104.8897193
      url: "url.com"
      postType: "Link"
    }
  )
  {
    post{
      id,
      text,
      latitude,
      longitude,
      ringMinMax,
      createdAt,
      userId,
      url,
      postType
    }
  }
}
```

###### Edit Post
```
mutation{
  editPost(input:{
    id: ID,
    text: "Jk, he's only right-handed",
    latitude: 71.835532572575,
    longitude: -118.50910685764141,
    userId: 40
  })
  {
    post {
      id
      text
    }
  }
}
```

###### Destroy Post
```
mutation {
  destroyPost(input:
    {
      id: ID,
    }
  )
  {
    post{
      id,
      text,
      latitude,
      longitude,
      ringMinMax,
      createdAt,
      userId
    }
  }
}
```

## Technologies
- Ruby
- Rails
- GraphQL
- PostgreSQL
- RSpec
- TravisCI
