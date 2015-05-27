require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /admin/groups" do
    it "works! (now write some real specs)" do
      get admin_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
