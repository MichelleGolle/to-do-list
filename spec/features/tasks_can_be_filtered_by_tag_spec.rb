require 'rails_helper'

RSpec.describe "task list" do
  it "can be searched by tag" do
    user = User.create(username: "kathryn", email: "kathryn@example.com", password: "password", password_confirmation: "password", id: 57)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    list = List.create(title: "pancake", user_id: 57)
    task1 = list.tasks.create(title: "cook them", completed: true)
    task2 = list.tasks.create(title: "eat", completed: true)
    tag1 = Tag.create(name: "yummy")
    tag2 = Tag.create(name: "mmmmm")
    task1.tags << tag1
    task2.tags << tag2

    visit list_tasks_path(list)

    find(:css, "#search-form").set("yummy")

    expect(page).to_not have_content("eat")

  end
end
