require 'rails_helper'

RSpec.describe "editing tasks" do
  context "as a registered user" do
    it "can be edited" do
      user = User.create(username: "kelly", email: "kelly@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit lists_path

      click_link_or_button "Create new list"
      fill_in "Title", with: "Groceries"
      click_link_or_button "Submit"
      expect(page).to have_content("Groceries")

      click_link_or_button "Groceries"
      click_link_or_button "Add new task"
      fill_in "Title", with: "Milk"
      fill_in "Description", with: "1%"
      fill_in "Due date", with: "7/1/15"
      click_link_or_button "Submit"

      expect(page).to have_content("Milk")

      click_link_or_button "Edit"
      fill_in "Description", with: "Chocolate"
      click_link_or_button "Submit"

      expect(page).to have_content("Chocolate")
      expect(page).to_not have_content("1%")
    end
  end
end
