WatchlistItem.destroy_all
Movie.destroy_all
User.destroy_all

user = User.create!(
  email: "mateusz@example.com",
  password: "secret123",
  password_confirmation: "secret123",
)

movies = [
  {
    external_id: "tmdb-603",
    title: "The Matrix",
    year: 1999,
    poster_url: "https://example.com/matrix.jpg",
    overview: "A hacker discovers that reality is not what it seems.",
    status: "watched",
    favorite: true,
  },
  {
    external_id: "tmdb-27205",
    title: "Inception",
    year: 2010,
    poster_url: "https://example.com/inception.jpg",
    overview: "A thief enters dreams to steal and plant ideas.",
    status: "want_to_watch",
    favorite: false,
  },
  {
    external_id: "tmdb-157336",
    title: "Interstellar",
    year: 2014,
    poster_url: "https://example.com/interstellar.jpg",
    overview: "A group of explorers travels through a wormhole in space.",
    status: "watching",
    favorite: false,
  },
]

movies.each do |movie_attributes|
  movie = Movie.create!(
    external_id: movie_attributes[:external_id],
    title: movie_attributes[:title],
    year: movie_attributes[:year],
    poster_url: movie_attributes[:poster_url],
    overview: movie_attributes[:overview],
  )

  WatchlistItem.create!(
    user: user,
    movie: movie,
    status: movie_attributes[:status],
    favorite: movie_attributes[:favorite],
  )
end
