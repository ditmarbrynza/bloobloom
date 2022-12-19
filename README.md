# README

How to start service:
1) `RAILS_ENV=development rails db:create`
2) `RAILS_ENV=development rails db:migrate`
3) `RAILS_ENV=development rails db:seed`
4) `RAILS_ENV=test rspec spec/`

How to make Requests:
*Use your personal Authorization token from user.api_token

1) Create Frame
```
curl --location --request POST 'http://localhost:3000/api/v1/frames' \
--header 'Authorization: c3a420d5a34e04f4b14ad78c619fcc' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "test name",
    "description": "test description",
    "status": "active",
    "currency_code": "840",
    "stock": 10,
    "price": 100
}'
```

2) Create Lense
```
curl --location --request POST 'http://localhost:3000/api/v1/lenses' \
--header 'Authorization: c3a420d5a34e04f4b14ad78c619fcc' \
--header 'Content-Type: application/json' \
--data-raw '{
    "color": "test",
    "description": "test description",
    "prescription_type": "fashion", 
    "lens_type": "classic",
    "stock": 10,
    "price": 40,
    "currency_code": "840"
}'
```
3) Get all Lense 
```
curl --location --request GET 'http://localhost:3000/api/v1/lenses'
```

4) Get only active Frames
```
curl --location --request GET 'http://localhost:3000/api/v1/frames'
```

5) Create Glasses
```
curl --location --request POST 'http://localhost:3000/api/v1/glasses' \
--header 'Authorization: c3a420d5a34e04f4b14ad78c619fcc' \
--header 'Content-Type: application/json' \
--data-raw '{
    "frame_id": 1,
    "lense_id": 1
}'
```

6) Get shopping basket
```
curl --location --request GET 'http://localhost:3000/api/v1/shopping_basket' \
--header 'Authorization: c3a420d5a34e04f4b14ad78c619fcc'
```

