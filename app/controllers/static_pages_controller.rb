class StaticPagesController < ApplicationController
  before_action :authenticate_admin_worker!
  def index
  end
end
