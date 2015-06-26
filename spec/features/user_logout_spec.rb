require 'rails_helper'

RSpec.describe 'user' do
  it 'can logout' do
    User.create(email: "michelle@example.com", username: "mg", password: "password", password_confirmation: "password")

    visit root_path

    click_link_or_button "Log In"
    fill_in "Email", with: "michelle@example.com"
    fill_in "Password", with: "password"
    click_button "Submit"
    visit root_path
    click_link_or_button "Log Out"
    expect(page).to have_content("Successfully logged out")
  end
end
