class CreateTasksTags < ActiveRecord::Migration
  def change
    create_table :tasks_tags do |t|
      t.integer :task_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
