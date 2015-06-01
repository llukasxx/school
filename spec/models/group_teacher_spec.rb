require 'rails_helper'

RSpec.describe GroupTeacher, type: :model do
  describe "validations" do
    it "teacher can't be assigned to same group twice" do
      teacher = create(:teacher)
      group = create(:group)
      group_teacher = build(:group_teacher)

      group_teacher.teacher_id = teacher.id
      group_teacher.group_id = group.id
      
      group_teacher.save

      expect(group_teacher).to be_valid

      group_teacher2 = build(:group_teacher)

      group_teacher2.teacher_id = teacher.id

      group_teacher2.group_id = group.id

      expect(group_teacher2).not_to be_valid

    end
  end
end
