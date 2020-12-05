# Guru Dev Challenge - API

The goal of this project is to create a very simple API to display playlists and videos from a Database.

## How to Access

This API has been deployed to 
```
https://guru-dev-challenge.herokuapp.com/
```

## Prerequisites

Project was developed using `ruby 2.6.6` , `Rails 6.0.3` and `PostgreSQL`. 

## Installation 

To make the app works locally, an account on Auth0 and an API must be created. You need to clone the repo and create an .env file with:

```
API_IDENTIFER=
API_DOMAIN=
API_CLIENT_ID=
API_CLIENT_SECRET=
API_CALLBACK_URL=

```
After setting up enviroments variables, you need to install all dependences, create, migrate and seed the database.

```
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s
```

Server will be ready on port 3000.

## How to Login

In order to achieve a fast solution, sign up and sign in must be made using Auth0 Interface. To access it, you must:

```
https://guru-dev-challenge.herokuapp.com/login
```

or

```
http://localhost:3000/login
```

After successful signup or signin, you will receive a json as a response. This JSON will have your JWT token that must be sent in header in every authenticated request.


## API Documentation

**List all playlists**
----
 Display a list with all playlists and its videos and sections
* **URL**
  /playlists

* **Method:**
  `GET`
* **Success Response:**
  * **Code:** 200
    **Content:**
    ```JSON
    [
      {
          "id": 1,
          "name": "Given To Fly",
          "description": "Rearviewmirror",
          "created_at": "2020-12-05T18:32:02.772Z",
          "updated_at": "2020-12-05T18:32:02.772Z",
          "min_subscription": "professional",
          "sections": [
              {
                  "id": 1,
                  "name": "Sholay",
                  "description": "I love the smell of napalm in the morning.",
                  "playlist_id": 1,
                  "created_at": "2020-12-05T18:32:02.790Z",
                  "updated_at": "2020-12-05T18:32:02.790Z",
                  "videos": [
                      {
                          "id": 1,
                          "name": "American Beauty",
                          "description": "Here's looking at you, kid.",
                          "section_id": 1,
                          "created_at": "2020-12-05T18:32:02.803Z",
                          "updated_at": "2020-12-05T18:32:02.803Z"
                      }
                  ]
                }
            ]
        }
      ]            
    ```
**List one specific playlists**
----
 Display informations about one specific playlist. Need to be authenticated. You can only see this endpoint if your subscription allows it. 
* **URL**
  /playlists

* **Method:**
  `GET`
*  **Headers**
  `Authorization: Bearer JsonWebtokenHash`
* **Success Response:**
  * **Code:** 200
    **Content:**
    ```JSON
      {
          "id": 1,
          "name": "Given To Fly",
          "description": "Rearviewmirror",
          "created_at": "2020-12-05T18:32:02.772Z",
          "updated_at": "2020-12-05T18:32:02.772Z",
          "min_subscription": "professional",
          "sections": [
              {
                  "id": 1,
                  "name": "Sholay",
                  "description": "I love the smell of napalm in the morning.",
                  "playlist_id": 1,
                  "created_at": "2020-12-05T18:32:02.790Z",
                  "updated_at": "2020-12-05T18:32:02.790Z",
                  "videos": [
                      {
                          "id": 1,
                          "name": "American Beauty",
                          "description": "Here's looking at you, kid.",
                          "section_id": 1,
                          "created_at": "2020-12-05T18:32:02.803Z",
                          "updated_at": "2020-12-05T18:32:02.803Z"
                      }
                  ]
                }
            ]
        }           
    ```
    ```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED

**Upgrade Subscription**
----
 Change subscriptions
 ```
 0: 'Basic'
 1: 'Premium'
 2: 'Professional
 ```
* **URL**
  /subscriptions
* **Method:**
  `POST`
*  **Body**
    ```JSON
    {
      "subscription": "2"
    }
    ```
* **Success Response:**
  * **Code:** 200
    **Content:** 
    ```JSON
        {
        "user": {
            "id": 3,
            "subscription": "professional",
            "first_name": null,
            "last_name": null,
            "email": "rodrigo321@43143324.com",
            "password_hash": null,
            "created_at": "2020-12-05T18:34:14.126Z",
            "updated_at": "2020-12-05T21:42:28.386Z"
        },
        "status": "updated"
     }
    ```
* **Error Response:**
  * **Code:** 401 UNAUTHORIZED
