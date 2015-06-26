require 'rails_helper'

RSpec.describe "User login" do
  context "as an unregistered user" do
    it "I can create an account and be logged in" do
      visit root_path
      click_link_or_button "Create Account"
      fill_in "First name", with: "Michelle"
      fill_in "Last name", with: "Golle"
      fill_in "Username", with: "mg"
      fill_in "Email", with: "michelle@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      click_link_or_button "Create User"
# save_and_open_page
      expect(page).to have_content("mg")
    end
  end
end
