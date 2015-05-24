require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "creating admin" do

    it "gets proper account type" do
      student = create(:student)
      expect(student.account_type).to eq("student")
    end

  end
end
