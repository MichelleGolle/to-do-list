class Task < ActiveRecord::Base
  has_many  :tasks_tags
  has_many  :tags, through: :tasks_tags
  belongs_to :list
  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

end
