class SearchController < ApplicationController
  def index
    @items = BestBuyItem.search_results(params[:q])
  end
end
