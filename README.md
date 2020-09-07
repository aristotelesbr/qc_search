# QC Search

## This project use docker stack with:

Ruby:

- `2.7.1`

Sinatra:

- `2.1`

RSpec:

- `3.9`

Databases:

- `Postgres11`
- `Elasticsearch 7.9.1`

## Instrunctions

> Assuming you already have the environment properly configured(docker and docker-compose) on your machine after cloning the project do:

Make a build to install dependencies:

```
$ docker-compose build
```

Create dadabase:

```
$ docker-compose run --rm app bundle exec rake db:create
```

Run migrations:

```
$ docker-compose run --rm app bundle exec rake db:migrate
```

## Import data

⚠️ Ensure elasticsearch has ben started

> Despite elasticsearch being a startup dependency for the application. The application startup time is still much shorter, which can cause a connection error if elasticsearch is not yet fully started.
> This feature not implemented in this version.

```
Caused by:
Errno::ECONNREFUSED: Connection refused - connect(2) for "elasticsearch" port 9200
```

If you received this message, wait for Elastic and run the task again.

I took the liberty of including a script file to facilitate the execution of docker tasks 😉:

This:

```
$ make setup
```

Equals:

```
$ docker-compose run --rm bundle exec rake app:setup
```

This will import the CSV data.

Run the tests:

> ⚠️ Persistence tests also use elasticsearch, so make sure he is up before starting this task.

```
$ make tests_prepare
```

or

```
$ docker-compose run --rm app bundle exec rake db:test:prepare
```

and

```
make test
```

or

```
$ docker-compose run --rm app bundle exec rake rspec
```

🎉

![terminal](https://github.com/aristotelesbr2014/qc_search/blob/master/data/terminal.png)

## Run application

```
$ docker-compose up
```

## How to use API

🔥 For subjects with hotter issues:

Send `GET` request to `/` (http://localhost:5000) queryString params `init_date`:

```
$ curl http://localhost:5000/?init_date=07-08-2019

```

🔥 For most accessed by period:

```
$ curl http://localhost:5000/?init_date=07-08-2019&end_date=06-090-2020
```

The response will be something like:

```json
{
  "data": [
    {
      "id": 1014,
      "statement": "Alias aut ut quia.",
      "text": "Occaecati molestiae velit. Ex repellat sapiente. Voluptatem ullam aut.",
      "answer": "D",
      "daily_access": 100,
      "discipline": "português",
      "created_at": "2020-03-07T17:37:55.511Z",
      "updated_at": "2020-03-07T17:37:55.511Z"
    },
    {
      "id": 94,
      "statement": "Consequatur velit eos architecto.",
      "text": "Voluptas accusamus in. Laudantium quia earum. Quasi recusandae tenetur.",
      "answer": "B",
      "daily_access": 98,
      "discipline": "raciocínio lógico",
      "created_at": "2020-01-01T03:16:51.048Z",
      "updated_at": "2020-01-01T03:16:51.048Z"
    },
    {...}
  ]
}
```

🎉

![insominia](https://github.com/aristotelesbr2014/qc_search/blob/master/data/insominia.png)

# 🕐 Pending

- [ ] Pagination
- [ ] Facories objects
- [ ] Provider Elastic test connection
- [ ] Cache layer
- [ ] Serach questions by week
- [ ] Tests enviroment config
- [ ] Mock tests response
- [ ] Strategies for cleaning test database(test enviroment)
