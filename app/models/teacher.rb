class Teacher < User
  has_many :teacher_lessons, dependent: :destroy
  has_many :lessons, through: :teacher_lessons

end
