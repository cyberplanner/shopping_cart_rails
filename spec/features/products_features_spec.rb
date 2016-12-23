require 'rails_helper'

feature 'products' do
  context 'no products yet' do
    scenario 'should display to add products' do
      visit '/'
      expect(page).to have_content 'no products yet'
      expect(page).to have_link 'add product'
    end
  end
  context 'products have been added' do
    before do
    Product.create(name: 'smarthub')
    end
    scenario 'display products' do
      visit '/products'
      expect(page).to have_content('smarthub')
      expect(page).not_to have_content('no products yet')
    end
  end
  context 'creating products' do
    scenario 'prompt user to fill out form which displays new product' do
      visit '/products'
      click_link 'add product'
      fill_in "Name", with: "smarthub"
      fill_in "Price", with: "2.99"
      click_button "Create Product"
      expect(page).to have_content('smarthub')
      expect(page).to have_content("£2.99")
      expect(current_path).to eq "/products"
    end
  end
  context 'viewing individual products' do
    scenario 'let user view individual product' do
      product1 = create(:product, name: 'xbox', price: 399.05)
      visit '/products'
      click_link 'xbox'
      expect(page).to have_content 'xbox'
      expect(page).to have_content '£399.05'
      expect(current_path).to eq "/products/#{product1.id}"
    end
  end
end
