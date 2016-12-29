require 'rails_helper'

feature 'products' do
  context 'No products added yet' do
    scenario 'should display a prompt to add a product' do
      visit '/'
      log_in

      expect(page).to have_content 'No products yet'
      expect(page).to have_link 'Add a product'
    end
  end

  context 'Products have been added' do
    before do
      Product.create(name: 'Smart Hub')
    end

    scenario 'display products' do
      visit '/products'
      log_in

      expect(page).to have_content('Smart Hub')
      expect(page).not_to have_content('No products yet')
    end
  end

  context 'creating products' do
    scenario 'prompts the admin to fill out a form, then displays the new product' do
      visit '/products'
      log_in

      click_link 'Add a product', :match => :prefer_exact
      fill_in 'Name', with: 'Motion Sensor'
      fill_in 'Price', with: '24.99'
      click_button 'Create Product'
      expect(page).to have_content 'Motion Sensor'
      expect(page).to have_content '£24.99'
      expect(current_path).to eq '/products'
    end
  end

  context 'viewing products' do

    scenario 'lets a user view products' do
      smoke_sensor = create(:product, name: "Smoke Sensor",
                            price: 19.99)

      visit '/products'
      log_in

      click_link 'Smoke Sensor'
      expect(page).to have_content 'Smoke Sensor'
      expect(page).to have_content '£19.99'
      expect(current_path).to eq "/products/#{smoke_sensor.id}"
    end

  end

  context 'editing products' do

    scenario 'let the admin edit or update a product' do
      smoke_sensor = create(:product, name: "Smoke Sensor",
                            price: 19.99)
      visit '/products'
      log_in

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
      log_in

      click_link 'Smoke Sensor'
      click_link 'Delete Smoke Sensor'
      expect(page).not_to have_content 'Smoke Sensor'
      expect(page).to have_content 'Product deleted successfully'
    end
  end

end
