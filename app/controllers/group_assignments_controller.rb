class GroupAssignmentsController < ApplicationController
  
  def index

  end

  def new
    if params[:type] == "teacher"
      @teachers = Teacher.all
      @groups = Group.all
      @object = GroupTeacher.new
    end
  end

  def create
    redirect_to action: "new", type: "teacher"
  end

  def teachers
    @teachers = Group.group_teachers.uniq
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
