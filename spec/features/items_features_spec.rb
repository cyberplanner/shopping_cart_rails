require 'rails_helper'

feature 'ordering' do
  before do
    Product.create name: 'sensor', price: 2.99
  end
    scenario 'user can see a order button but can order items' do
      log_in
      visit '/products'
      click_link 'Order sensor'
      fill_in "Quantity", with: 2
      click_button "Add to basket"

      expect(current_path).to eq '/products'
      expect(page).to have_content "2 item(s) were added to basket"
    end
end
