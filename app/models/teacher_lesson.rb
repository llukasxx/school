class TeacherLesson < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :lesson
  validates :teacher_id, presence: true
  validates :lesson_id, presence: true
end
