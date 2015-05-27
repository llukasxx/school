class Lesson < ActiveRecord::Base
  has_many :teacher_lessons, dependent: :destroy
  has_many :teachers, through: :teacher_lessons
  validates :name, presence: true, length: {maximum: 100}
end
