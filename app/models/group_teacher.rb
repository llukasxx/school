class GroupTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
end
