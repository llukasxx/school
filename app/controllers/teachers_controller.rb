class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all.where('account_type = ?', 'teacher')
  end

  def show
    @teacher = Teacher.find(params[:id])
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
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      flash[:success] = "Teacher has been successfully updated"
      redirect_to admin_teacher_path(@teacher)
    else
      render 'edit'
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    if @teacher.destroy
      redirect_to admin_teachers_path
      flash[:alert] = "Teacher successfully destroyed"
    end
  end

  private

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
