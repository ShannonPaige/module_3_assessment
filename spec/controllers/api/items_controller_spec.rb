require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  let!(:item) {Item.create(name: "item_name",
                          description: "item_description",
                          image_url: "item_url",
                          created_at: "2016-03-08 04:21:31",
                          updated_at: "2016-03-14 04:21:31")}

  let!(:item2) {Item.create(name: "item_name",
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

  describe 'GET #show' do
    it "returns http success" do
      get :show, format: :json, id: item.id
      expect(response).to have_http_status(:success)
    end

    it "returns multiple items" do
      get :show, format: :json, id: item.id
      assert_kind_of Hash, json_response
    end

    it "returns the correct items" do
      get :show, format: :json, id: item.id

      assert_equal item.name, json_response["name"]
      assert_equal item.description, json_response["description"]
      assert_equal item.image_url, json_response["image_url"]
    end
  end

  describe 'POST #create' do
    it "returns http success" do
      post :create, format: :json, name: "new_item_name", description: "new_item_description", image_url: "new_item_url"
      expect(response).to have_http_status(:success)
    end

    it "returns success when item creation is completed" do
      post :create, format: :json, name: "new_item_name", description: "new_item_description", image_url: "new_item_url"
      get :show, format: :json, id: item.id
      expect(response).to have_http_status(:success)
    end

    it "returns the correct item" do
      post :create, format: :json, name: "new_item_name", description: "new_item_description", image_url: "new_item_url"

      assert_equal "new_item_name", json_response["name"]
      assert_equal "new_item_description", json_response["description"]
      assert_equal "new_item_url", json_response["image_url"]
    end
  end

  describe 'DELETE #delete' do
    it "returns http success" do
      get :destroy, format: :json, id: item.id
      expect(response).to have_http_status(:success)
    end

    it "returns http failure when delete is completed" do
      get :destroy, format: :json, id: item.id
      expect { get :show, format: :json, id: item.id }.to raise_exception(ActiveRecord::RecordNotFound)
    end

    it "returns the item deleted" do
      get :destroy, format: :json, id: item.id

      assert_equal item.name, json_response["name"]
      assert_equal item.description, json_response["description"]
      assert_equal item.image_url, json_response["image_url"]
    end
  end
end
