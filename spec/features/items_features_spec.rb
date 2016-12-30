require 'rails_helper'

feature 'ordering' do
  before do
    Product.create name: 'sensor', price: 2.99
  end
    scenario 'user can order items' do
      log_in
      order_item

      expect(current_path).to eq '/products'
      expect(page).to have_content "2 item(s) were added to basket"
      click_link 'My basket'
      expect(current_path).to eq basket_path
      expect(page).to have_content "sensor : 2"
      expect(page).to have_content "Subtotal: £5.98"
    end

end
