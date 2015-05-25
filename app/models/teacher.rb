class Teacher < User
  has_many :teacher_lessons
  has_many :lessons, through: :teacher_lessons

  def set_type
    super
  end
end
