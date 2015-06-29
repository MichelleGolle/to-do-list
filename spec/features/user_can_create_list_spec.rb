require 'rails_helper'

RSpec.describe "On user dashboard" do
  context "when logged in" do
    it "I can add a list" do
      user = User.create(username: "user", email: "u@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit lists_path

      expect(page).to have_content("user's task lists")

      click_link_or_button "Create new list"
      fill_in "Title", with: "Homework"
      click_link_or_button "Submit"

      expect(page).to have_content("Homework")
    end
  end

  context "with invalid entry" do
    it "cannot be created" do
      user = User.create(username: "test", email: "test@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit lists_path

      expect(page).to have_content("test's task lists")

      click_link_or_button "Create new list"
      fill_in "Title", with: ""
      click_link_or_button "Submit"

      expect(page).to have_content("Invalid")
    end
  end
end
