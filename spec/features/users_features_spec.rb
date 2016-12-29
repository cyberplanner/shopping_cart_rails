require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it "should not see 'sign out' link" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "user signed in on the homepage" do
    before do
      visit '/'
      click_link 'Sign up', :match => :prefer_exact
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'testtest', :match => :prefer_exact
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    it "should see 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end

    it "should see a link to his shopping basket" do
      visit '/'
      expect(page).to have_link 'My basket'
      click_link 'My basket'
      expect(page).to have_content 'Basket is empty!'
    end
  end
end
