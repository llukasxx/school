class User < ActiveRecord::Base
  before_create :set_type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :group_only_for_student

  def set_type
    if self.class == Admin
      self.account_type = "admin"
    elsif self.class == Teacher
      self.account_type = "teacher"
    elsif self.class == Student
      self.account_type = "student"
    end
  end

  def group_only_for_student
    if self.group_id != nil && (self.class == Admin || self.class == Teacher)
      errors.add(:group_id,"Admin or Teacher can't be assigned to group")
    end
  end
  
end
