class BestBuyItem

  def self.service
    BestBuyService.new
  end

  def self.search_results(keyword)
    results = service.product_search(keyword)
    binding.pry
  end
end
