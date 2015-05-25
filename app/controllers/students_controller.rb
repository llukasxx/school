class StudentsController < ApplicationController
  def index
    @students = Student.all.where('account_type = ?', 'student')
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_students_path
      flash[:notice] = "Student created"
    else
      redirect_to new_admin_student_path(@student)
      flash[:alert] = "Sth went wrong"
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:success] = "Teacher has been successfully updated"
      redirect_to admin_student_path(@student)
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to admin_students_path
      flash[:alert] = "Student successfully destroyed"
    end
  end

  private

    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
