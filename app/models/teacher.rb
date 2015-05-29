class Teacher < User
  has_many :group_teachers, dependent: :destroy
  has_many :groups, through: :group_teachers
  has_many :students, through: :groups
  has_many :group_lessons, through: :groups
  has_many :lessons, through: :group_lessons

end
