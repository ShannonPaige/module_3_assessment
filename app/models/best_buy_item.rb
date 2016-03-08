class BestBuyItem

  def self.service
    BestBuyService.new
  end

  def self.search_results(keyword)
    results = service.product_search(keyword)[:products]
    results.map { |result| build_object(result) }
  end

private

  def self.build_object(data)
    OpenStruct.new(data)
  end
end
