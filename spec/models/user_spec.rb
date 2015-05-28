require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "creating user" do

    it "gets proper account type" do
      admin = create(:admin)
      teacher = create(:teacher)
      student = create(:student)
      expect(admin.account_type).to eq("admin")
      expect(teacher.account_type).to eq("teacher")
      expect(student.account_type).to eq("student")
    end

    it "tests for valid user" do
      student = build(:student)
      student.first_name = ""
      expect(student.valid?).not_to be true
    end

    it "can't save admin with group_id" do
      admin = build(:admin)
      admin.group_id = 5
      expect(admin).not_to be_valid
    end

    it "can't save teacher with group_id" do
      teacher = build(:teacher)
      teacher.group_id = 6
      expect(teacher).not_to be_valid
    end

    it "can save student with group_id" do
      student = build(:student)
      student.group_id = 7
      expect(student).to be_valid
    end

  end


end