require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe "creating teacher" do

    it "gets proper account type" do
      teacher = create(:teacher)
      expect(teacher.account_type).to eq("teacher")
    end

  end
end
