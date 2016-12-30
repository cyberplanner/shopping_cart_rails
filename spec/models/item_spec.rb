require 'spec_helper'


describe Item, type: :model do
  it 'is not valid without a user_id' do
    item = Item.new(name: "sensor", price: 99.99)
    expect(item).to have(1).error_on(:user_id)
    expect(item).not_to be_valid
  end
end
