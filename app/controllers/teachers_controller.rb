class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teachers_path
      flash[:notice] = "Teacher created"
    else
      redirect_to new_admin_teacher_path(@teacher)
      flash[:alert] = "Sth went wrong"
    end
  end

  def edit
  end

  private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
