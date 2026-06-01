class MoviesSearchController < ApplicationController
  def search
    @query = params[:query]

    movie_search_service = MovieSearchService.new(@query)
    @movies_list = movie_search_service.search

    flash.now[:alert] = movie_search_service.error_message if movie_search_service.error_message.present?
  end
end
