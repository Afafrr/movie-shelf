# Movie Shelf
Application for searching movies and managing a personal movie watchlist.

- search movies using the OMDb API,
- add movies to their watchlist,
- mark movies as want to watch, watching, or watched,
- mark movies as favorites,
- filter the watchlist by status,
- remove movies from the watchlist.


## Setup

```sh
bundle install
bin/rails db:prepare
```

Create an `.env` file with an OMDb API key:

```sh
OMDB_API_KEY=your_api_key
```

Start the app:

```sh
bin/dev
```

Then open:

```text
http://localhost:3000
```

## Tests

Run all tests:

```sh
bin/rails test
```

Run one test file:

```sh
bin/rails test test/models/watchlist_item_test.rb
```