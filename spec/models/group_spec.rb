require 'rails_helper'

RSpec.describe Group, type: :model do

  describe "#self.group_teachers" do

    #I know it's a very bad test, will refactor it later when get more experience 
    it "returns unique sorted array of group teachers" do
      teacher = create(:teacher)
      group   = create(:group)
      group_teacher = build(:group_teacher)
      group_teacher.teacher_id = teacher.id
      group_teacher.group_id   = group.id
      group_teacher.save
      expect(Group.group_teachers.first).to eq(teacher)
    end

  end
  
end
