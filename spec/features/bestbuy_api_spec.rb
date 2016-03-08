require 'rails_helper'

describe "best buy api" do

    it "user can search for items with single keyword" do
      visit '/'

      expect(page).to have_content "Search Best Buy For Items"
      fill_in "q", with: "sennheiser"
      click_button "Search"

      expect(current_path).to eq search_index_path
      expect(page).to have_content 'Your search returned 15 items'
      expect(page).to have_content 'Sennheiser'
    end

    it "user can search for items with single keyword" do
      visit '/'

      expect(page).to have_content "Search Best Buy For Items"
      fill_in "q", with: "sennheiser headphones white"
      click_button "Search"

      expect(current_path).to eq search_index_path
      expect(page).to have_content 'Your search returned 3 items'
      expect(page).to have_content 'Sennheiser'
    end

    it "lets user know if no items returned" do
      visit '/'

      expect(page).to have_content "Search Best Buy For Items"
      fill_in "q", with: "shannonpaige"
      click_button "Search"

      expect(current_path).to eq search_index_path
      expect(page).to have_content 'Your search returned 0 items'
    end

end
