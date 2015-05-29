class GroupLesson < ActiveRecord::Base
  belongs_to :group
  belongs_to :lesson

  validates :group_id, presence: true
  validates :lesson_id, presence: true
end