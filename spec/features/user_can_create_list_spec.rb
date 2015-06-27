require 'rails_helper'

RSpec.describe "On user dashboard" do
  context "when logged in" do
    it "I can add a list" do
      user = User.create(username: "megan", email: "megan@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit lists_path

      expect(page).to have_content("megan's task lists")

      click_link_or_button "Create new list"
      fill_in "Title", with: "Homework"
      click_link_or_button "Submit"

      expect(page).to have_content("Homework")
    end
  end
end
