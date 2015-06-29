require 'rails_helper'

RSpec.describe "deleting lists" do
  context "as a logged in user" do
    it "cannot delete an unarchived list" do
      user = User.create(username: "ellen", email: "ellen@example.com", password: "password", password_confirmation: "password")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit lists_path

      expect(page).to have_content("ellen's task lists")

      click_link_or_button "Create new list"
      fill_in "Title", with: "Homework"
      click_link_or_button "Submit"

      expect(page).to have_content("Homework")

      expect(page).to_not have_content("Delete")

    end

    it "can delete an archived list" do
      user = User.create(username: "wally", email: "w@example.com", password: "password", password_confirmation: "password", id: 44)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      List.create(title: "todo", archived: true, user_id: 44)

      visit archived_path

      expect(page).to have_content("todo")

      click_link_or_button "Delete"

      expect(page).to_not have_content("todo")

    end
  end
end
