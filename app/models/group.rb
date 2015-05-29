class Group < ActiveRecord::Base
  validates :name, presence: true
  has_many :students
  has_many :group_lessons, dependent: :destroy
  has_many :lessons, through: :group_lessons
  has_many :group_teachers, dependent: :destroy
  has_many :teachers, through: :group_teachers

  def self.group_teachers
    Teacher.joins(:groups)
  end

end
