class GroupTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group

  validates :group_id, presence: true
  validates :teacher_id, presence: true

  validates_uniqueness_of :group_id, scope: :teacher_id
end
