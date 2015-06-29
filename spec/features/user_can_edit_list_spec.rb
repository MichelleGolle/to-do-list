require 'rails_helper'

RSpec.describe "Editing lists" do
  context "as a logged in user" do
    it "can edit a list" do
      user = User.create(username: "dj", email: "dj@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit lists_path

      expect(page).to have_content("dj's task lists")

      click_link_or_button "Create new list"
      fill_in "Title", with: "run"
      click_link_or_button "Submit"

      expect(page).to have_content("run")

      click_link_or_button "Edit"

      fill_in "Title", with: "Shopping"


      click_link_or_button "Submit"
      expect(page).to have_content("Shopping")
      expect(page).to_not have_content("run")
    end
  end
end
