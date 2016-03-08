class SearchController < ApplicationController
  def index
    @items = BestBuyItem.search_results(params[:q])
    binding.pry
  end
end
