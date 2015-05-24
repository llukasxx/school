require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  describe "creating admin" do

    it "gets proper account type" do
      admin = create(:admin)
      expect(admin.account_type).to eq("admin")
    end

  end


end
