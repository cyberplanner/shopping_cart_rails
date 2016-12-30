def order_item
  visit '/products'
  click_link 'Order sensor'
  fill_in "Quantity", with: 2
  click_button "Add to basket"
end
