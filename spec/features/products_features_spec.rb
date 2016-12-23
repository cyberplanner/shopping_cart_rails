require 'rails_helper'

feature 'products' do
  context 'no products yet' do
    scenario 'should display to add products' do
      visit '/'
      expect(page).to have_content 'no products yet'
      expect(page).to have_link 'add product'
    end
  end
end
