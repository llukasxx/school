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

  end


end