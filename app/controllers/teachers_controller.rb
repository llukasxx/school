class TeachersController < ApplicationController
  
  def index
    @teachers = Teacher.all
  end

  def new
    
  end


end
