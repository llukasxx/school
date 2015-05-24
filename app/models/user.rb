class User < ActiveRecord::Base
  before_create :set_type
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_type

    if self.class == Admin
      self.account_type = "admin"
    elsif self.class == Teacher
      self.account_type = "teacher"
    elsif self.class == Student
      self.account_type = "student"
    end

  end
  
end
