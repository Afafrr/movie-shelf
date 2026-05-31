class WatchlistItemsController < ApplicationController
  def index
    @user = User.first
    @watchlist_items = @user.watchlist_items.includes(:movie)
  end

  def update
    @user = User.first
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
    @user = User.first
    @watchlist_item = @user.watchlist_items.destroy(params[:id])

    if @watchlist_item
      redirect_to watchlist_items_path, notice: "Item deleted."
    else
      redirect_to watchlist_items_path, alert: "Could not delete item."
    end
  end
end
