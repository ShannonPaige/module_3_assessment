require 'rails_helper'

describe "api" do

  let!(:item) {Item.create(name: "item_name",
                          description: "item_description",
                          image_url: "item_url",
                          created_at: "2016-03-08 04:21:31",
                          updated_at: "2016-03-14 04:21:31")}

    it "user can get a list of items" do
      visit '/api/v1/items'

      expect(page).to have_content "item_name"
      expect(page).to have_content "item_description"
      expect(page).to have_content "item_url"
      expect(page).not_to have_content "2016-03-08 04:21:31"
      expect(page).not_to have_content "2016-03-14 04:21:31"
    end

    it "user can get a single item" do
      visit "/api/v1/items/#{item.id}"

      expect(page).to have_content "item_name"
      expect(page).to have_content "item_description"
      expect(page).to have_content "item_url"
      expect(page).not_to have_content "2016-03-08 04:21:31"
      expect(page).not_to have_content "2016-03-14 04:21:31"
    end
end
