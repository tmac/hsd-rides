
# README
* Notes, issues, random thoughts ... overthinking 
  - No authentication or authorization
  - Jobs are being run inline during seeding (https://github.com/rails/rails/issues/35812) and otherwise would run on the default ActiveJob in memory queue. This would of course have to be changed to Sidekiq, Resque etc...
  - Curser pagination would likely be a better solution but it was causing pain, had to move on.   
  - All distance and duration info gathered from Google Directions API is stored in the DB and not auto refreshed. I think some scheduled process to periodically update those based on `Ride#calculations_updated_at` and `Commute#calculations_updated_at` would be necessary. They will update if either the start, destination or driver home addresses change but obviously not for external things like road closures, construction etc... Do they need to be near realtime? Refreshed every minumte? hour? day? week?
  - Feel like I'm missing something here? Don't want to be storing every possible driver / ride combination in the country. Some way to scope those combinations by city or region or perhaps with a radial search. Or maybe it's enough that rides would simply fall away as pickup times pass.  ... not sure exactly
  - sounds like the commute time does not include the return trip from the ride destination
  - some crazy data in my randomly seeded addresses ... like scores close to 130 ... short commute and very long drive appears to be the cause.
  - The list goes on, I'm thinking too hard.  

* Ruby version  
    3.2.2

* Rails - light API install  
    rails new hsd-rides --api --skip-action-mailer --skip-action-mailbox --skip-action-cable --database=postgresql 

* System dependencies  
    PostgreSQL

* Database creation, initialization and seeding  
    rake db:create  
    rake db:schema:load or db:migrate  
    rake db:seed # This may take a minute. There should now be driver IDs 1 - 4, each with 20 rides  
    rake db:test:prepare  

* How to run the test suite  
    rspec spec/


## API
### List all Rides for a given driver [GET /api/v1/drivers/{driver_id}/rides?page=1]

escape the ? (\\?) on zsh  
`curl http://localhost:3000/api/v1/drivers/1/rides?page=1` 

#### Successful response:  
```
{"status":"succeeded", "rides":[
{
  "id": 3,
  "start_address": "4329 Howe Street, Oakland CA 94611",
  "destination_address": "1532 Milvia Street, Berkeley CA 94709",
  "distance": "5.0",
  "duration": "17.0",
  "earnings": "13.4",
  "calculations_updated_at": "2023-08-12 20:49:52 UTC",
  "created_at": "2023-08-12 20:49:51 UTC",
  "updated_at": "2023-08-12 20:49:52 UTC",
  "score": "17.4",
  "cummute_duration": "29.0",
  "cummute_distance": "21.0"
},
...,
...
],"total_pages":4,"current_page":1}

```

#### Failed response:  
```
{ "status":"failed","message":"no driver or rides found" }

```