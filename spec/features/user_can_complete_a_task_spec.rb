require 'rails_helper'

RSpec.describe "Creating tasks" do
  context "as a registered user" do
    it "can create a task" do
      user = User.create(username: "kelly", email: "kelly@example.com", password: "password", password_confirmation: "password", id: 55)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      list = List.create(title: "pancake", user_id: 55)
      list.tasks.create(title: "cook them", completed: true)
      visit list_tasks_path(list)


      expect(page).to_not have_content("pancake")

    end
  end
end
