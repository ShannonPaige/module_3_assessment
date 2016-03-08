require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  let!(:item) {Item.create(name: "item_name",
                          description: "item_description",
                          image_url: "item_url",
                          created_at: "2016-03-08 04:21:31",
                          updated_at: "2016-03-14 04:21:31")}

  describe 'GET #index' do
    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end

    it "returns multiple items" do
      get :index, format: :json
      assert_kind_of Array, json_response
      assert_equal Item.count, json_response.count
    end

    it "returns the correct items" do
      get :index, format: :json
      object1 = json_response.first

      assert_equal item.name, object1["name"]
      assert_equal item.description, object1["description"]
      assert_equal item.image_url, object1["image_url"]
    end

  end
end
