require 'rails_helper'

RSpec.describe AdminWorkersController, type: :controller do

  

  before(:each) do
    admin_worker = create(:admin_worker)
    sign_in admin_worker
  end

  describe "GET #index" do
    it "responds successfully with proper status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
