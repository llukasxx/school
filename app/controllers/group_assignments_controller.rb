class GroupAssignmentsController < ApplicationController
  
  def index

  end

  def new
    if params[:type] == "teacher"
      @teachers = Teacher.all.where('account_type = ?', 'teacher')
      @groups = Group.all
      @object = GroupTeacher.new
    end
  end

  def create
    
    if !params[:group_teacher].nil?
      @group_teacher = GroupTeacher.new(group_teacher_params)
      if @group_teacher.save
        flash[:notice] = "Assignment has been saved"
        redirect_to teachers_admin_group_assignments_path
      else
        flash[:alert] = "Something went wrong"
        redirect_to new_admin_group_assignment_path(:type => 'teacher')
      end
    end
  end

  def teachers
    @teachers = Group.group_teachers
  end

  def new_teacher_assignment

  end

  def students
    
  end

  def lessons
    
  end

  private

    def group_teacher_params
      params.require(:group_teacher).permit(:teacher_id, :group_id)
    end

end
