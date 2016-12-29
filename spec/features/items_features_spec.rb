require 'rails_helper'

feature 'Ordering items' do
  context 'user is not logged in' do
    scenario 'user can see a order button but can order items' do
      sensor = create(:product, name: "sensor", price: 2.99)
      visit '/'

      expect(page).to have_content "sensor"
      expect(page).to have_link "Order sensor"
      click_link 'Order sensor'
      expect(page).to have_content 'Please log in or sign up first!'
    end
  end
end
