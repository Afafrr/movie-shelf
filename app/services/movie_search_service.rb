require "net/http"
require "json"

class MovieSearchService
  URL = "https://www.omdbapi.com/"
  API_KEY = ENV["OMDB_API_KEY"]

  attr_reader :error_message

  def initialize(query)
    @query = query
  end

  def search
    return [] if @query.blank?

    uri = URI(URL)
    uri.query = URI.encode_www_form(apikey: API_KEY, s: @query)

    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)

    if data["Response"] == "False"
      @error_message = data["Error"]
      return []
    end

    return [] if data["Search"].blank?

    data["Search"].map do |movie|
      {
        external_id: movie["imdbID"],
        title: movie["Title"],
        year: movie["Year"].to_i,
        poster_url: movie["Poster"],
        overview: "",
      }
    end
  rescue SocketError, Net::OpenTimeout, Net::ReadTimeout, JSON::ParserError => error
    Rails.logger.error("OMDb search failed: #{error.class} - #{error.message}")

    @error_message = "Couldn't find movies."
    []
  end
end
