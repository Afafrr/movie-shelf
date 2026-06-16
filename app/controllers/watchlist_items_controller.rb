class WatchlistItemsController < ApplicationController
  before_action :is_auth

  def index
    @status = params[:status]
    @user = current_user
    @watchlist_items = @user.watchlist_items.includes(:movie)

    if @status.present?
      @watchlist_items = @watchlist_items.where(status: @status)
    end
  end

  def create
    movie_params = params[:movie]
    movie = Movie.find_or_create_by(external_id: movie_params[:external_id]) do |movie|
      movie.external_id = movie_params[:external_id]
      movie.title = movie_params[:title]
      movie.year = movie_params[:year]
      movie.poster_url = movie_params[:poster_url]
      movie.overview = movie_params[:overview]
    end

    unless movie.persisted?
      redirect_to search_movies_path, alert: movie.errors.full_messages.to_sentence
      return
    end

    @user = current_user
    watchlist_item = @user.watchlist_items.new(
      movie: movie,
      favorite: false,
      status: "want_to_watch",
    )

    if watchlist_item.save
      redirect_to watchlist_items_path, notice: "Movie added to watchlist."
    else
      redirect_to search_movies_path(query: params[:query]), alert: watchlist_item.errors.full_messages.to_sentence
    end
  end

  def update
    @user = current_user
    @watchlist_item = @user.watchlist_items.find(params[:id])
    watch_param = params[:watchlist_item]
    result = @watchlist_item.update(status: watch_param[:status], favorite: watch_param[:favorite])

    if result
      redirect_to watchlist_items_path, notice: "Status updated."
    else
      redirect_to watchlist_items_path, alert: "Could not update status."
    end
  end

  def destroy
    @user = current_user
    @watchlist_item = @user.watchlist_items.destroy(params[:id])

    if @watchlist_item
      redirect_to watchlist_items_path, notice: "Item deleted."
    else
      redirect_to watchlist_items_path, alert: "Could not delete item."
    end
  end
end
