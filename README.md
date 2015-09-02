
# Setup

1. bundle install

## Database

SQLite3 is used for simplicity

1. copy database config ```cp config/database.yml.sample config/database.yml```

2. Prepare database ```rake db:create && rake db:migrate```

3. Seed data ```rake db:seed```, available country codes: `uk, de, pl`

4. run rails server ```rails s```

# API endpoints

##Public /api/v1/public/

### locations

`http://localhost:3000/api/v1/public/locations/:country_code`

### target groups

`http://localhost:3000/api/v1/public/target_groups/:country_code`

## Private /api/v1/private/

### authentication token

`too-many-secrets`

### locations

`http://localhost:3000/api/v1/private/locations/pl?token=too-many-secrets`

### target groups

`http://localhost:3000/api/v1/private/target_groups/pl?token=too-many-secrets`

### Unauthorized access

Any private endpoint call without token causes `Unauthorized` error (code 401)

### evaluate target

POST `http://localhost:3000/api/v1/private/evaluate_target/?token=too-many-secrets`

#### evaluate_target sample payload

```JSON
{
    "country_code": "uk",
    "target_group_id": 1,
    "locations": [
      {
        "id":123,
        "panel_size": 200
      }
    ]
}
```

#### evaluate_target sample response

```JSON
{
    "price": 56
}
```
