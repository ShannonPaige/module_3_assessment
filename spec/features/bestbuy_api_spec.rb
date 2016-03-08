require 'rails_helper'

describe "best buy api" do

    it "user can search for items" do
      visit '/'

      expect(page).to have_content "Search Best Buy Api"
      fill_in "Keyword", with: "sennheiser"
      click_button "Search"

      expect(current_path).to eq '/search'
      expect(page).to have_content '15 Results'
      expect(page).to have_content 'Content Goes Here'
    end

end
