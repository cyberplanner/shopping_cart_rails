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
end
