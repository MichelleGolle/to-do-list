class Seed
 def self.start
   new.generate
 end

 def generate
  #  create_Lists_with_categories
  #  create_users
  #  create_orders
 # end

 # def create_users
   user_list = [
               ["Rachel", "Warbelow", "demo+rachel@jumpstartlab.com", "password"],
               ["Jeff", "Casimir", "demo+jeff@jumpstartlab.com", "password", "j3"],
               ["Jorge", "Tellez", "demo+jorge@jumpstartlab.com", "password", "novohispano", 33],
               ["Josh", "Cheek", "demo+josh@jumpstartlab.com", "password", "josh"]
               ]
   user_list.each do |user|
     User.create(:first_name => user[0], :last_name => user[1], :email => user[2], :password => user[3], :username => user[4], :id => user[5])
   end
 # end

  # def create_orders
  # end


 # def create_Lists_with_categories
   work  = Tag.create(name: "work")
   school = Tag.create(name: "school")
   home = Tag.create(name: "home")
   chores = Tag.create(name: "chores")
   groceries = Tag.create(name: "groceries")
   pets = Tag.create(name: "pets")
   shopping = Tag.create(name: "shopping")
   urgent = Tag.create(name: "urgent")
   kids = Tag.create(name: "kids")

   list1 =  List.create(title: "List1", user_id: 33)
   list2 = List.create(title: "List2", user_id:33)
   list3 = List.create(title: "List3", user_id: 33)
   list4 = List.create(title: "List4", user_id: 33)
   list5 = List.create(title: "List5", user_id: 33)

 # end

  list1.tasks.create(title: "task1", description: "task1 description", due_date: "7/1/15").tags << urgent
  list1.tasks.create(title: "task2", description: "task2 description", due_date: "7/1/15", completed: true).tags << kids
  list1.tasks.create(title: "task3", description: "task3 description", due_date: "7/1/15", completed: true).tags << school
  list1.tasks.create(title: "task4", description: "task4 description", due_date: "7/1/15").tags << work
  list1.tasks.create(title: "task5", description: "task5 description", due_date: "7/1/15").tags << home


  list2.tasks.create(title: "task1", description: "task1 description", due_date: "7/1/15").tags << urgent
  list2.tasks.create(title: "task2", description: "task2 description", due_date: "7/1/15", completed: true).tags << kids
  list2.tasks.create(title: "task3", description: "task3 description", due_date: "7/1/15", completed: true).tags << school
  list2.tasks.create(title: "task4", description: "task4 description", due_date: "7/1/15").tags << work
  list2.tasks.create(title: "task5", description: "task5 description", due_date: "7/1/15").tags << home

  list3.tasks.create(title: "task1", description: "task1 description", due_date: "7/1/15").tags << urgent
  list3.tasks.create(title: "task2", description: "task2 description", due_date: "7/1/15", completed: true).tags << kids
  list3.tasks.create(title: "task3", description: "task3 description", due_date: "7/1/15", completed: true).tags << school
  list3.tasks.create(title: "task4", description: "task4 description", due_date: "7/1/15").tags << work
  list3.tasks.create(title: "task5", description: "task5 description", due_date: "7/1/15").tags << home

  list4.tasks.create(title: "task1", description: "task1 description", due_date: "7/1/15").tags << urgent
  list4.tasks.create(title: "task2", description: "task2 description", due_date: "7/1/15", completed: true).tags << kids
  list4.tasks.create(title: "task3", description: "task3 description", due_date: "7/1/15", completed: true).tags << school
  list4.tasks.create(title: "task4", description: "task4 description", due_date: "7/1/15").tags << work
  list4.tasks.create(title: "task5", description: "task5 description", due_date: "7/1/15").tags << home

  list5.tasks.create(title: "task1", description: "task1 description", due_date: "7/1/15").tags << urgent
  list5.tasks.create(title: "task2", description: "task2 description", due_date: "7/1/15", completed: true).tags << kids
  list5.tasks.create(title: "task3", description: "task3 description", due_date: "7/1/15", completed: true).tags << school
  list5.tasks.create(title: "task4", description: "task4 description", due_date: "7/1/15").tags << work
  list5.tasks.create(title: "task5", description: "task5 description", due_date: "7/1/15").tags << home

 end
end

Seed.start
