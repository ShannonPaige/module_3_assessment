class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:apiKey] = ENV['bestbuy_key']
    end
  end

  def product_search(keyword)
    parse(connection.get("products(longDescription=#{keyword}*)?pageSize=15&show=sku,name,salePrice,customerReviewAverage,shortDescription&format=json"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
