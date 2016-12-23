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

  context 'editing products' do

    scenario 'let the admin edit or update a product' do
      smoke_sensor = create(:product, name: "Smoke Sensor",
                            price: 19.99)
      visit '/products'

      click_link 'Smoke Sensor'
      click_link 'Edit Smoke Sensor'
      fill_in 'Name', with: 'Smart Smoke Sensor 3000'
      fill_in 'Price', with: '24.99'
      click_button 'Update Product'
      expect(page).to have_content 'Smart Smoke Sensor 3000'
      expect(page).to have_content '£24.99'
      expect(current_path).to eq '/products'
    end

  end

  context 'deleting products' do
      scenario 'let the admin delete a product' do
        smoke_sensor = create(:product, name: "Smoke Sensor",
                              price: 19.99)

        visit '/products'


        click_link 'Smoke Sensor'
        click_link 'Delete Smoke Sensor'
        expect(page).not_to have_content 'Smoke Sensor'
        expect(page).to have_content 'Product deleted successfully'
      end
    end
end
