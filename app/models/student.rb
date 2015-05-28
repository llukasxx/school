class Student < User
  belongs_to :group
  has_many :group_lessons, through: :group
  has_many :lessons, through: :group_lessons 
  has_many :teachers, through: :group
end
