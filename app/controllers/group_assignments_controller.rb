class GroupAssignmentsController < ApplicationController
  
  def index

  end

  def new_group_teacher
    @teachers = Teacher.all.where('account_type = ?', 'teacher')
    @groups = Group.all
    @group_teacher = GroupTeacher.new
  end

  def new_group_student
    @students = Student.all.where('account_type = ?', 'student')
    @groups = Group.all
  end

  def new_group_lesson
    @lessons = Lesson.all
    @groups = Group.all
    @group_lesson = GroupLesson.new
  end

  def create_group_teacher
    @group_teacher = GroupTeacher.new(group_teacher_params)
    if @group_teacher.save
      flash[:notice] = "Assignment has been saved"
      redirect_to teachers_admin_group_assignments_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to add_teacher_admin_group_assignments_path
    end
  end

  def create_group_student
    @student = Student.find(group_student_params[:student_id]) if (!group_student_params[:student_id].empty? && !group_student_params[:group_id].empty?)
    if @student
      @student.update_attribute(:group_id, group_student_params[:group_id])
      flash[:notice] = "Student's group successfully updated"
      redirect_to students_admin_group_assignments_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to add_student_admin_group_assignments_path
    end
  end

  def create_group_lesson
    @group_lesson = GroupLesson.new(group_lesson_params)
    if @group_lesson.save
      flash[:notice] = "Assignment has been saved"
      redirect_to lessons_admin_group_assignments_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to add_lesson_admin_group_assignments_path
    end
  end

  def teachers
    @teachers = Group.group_teachers
  end

  def students
    @students_with_group = Student.where("group_id is NOT NULL")
    @student_wo_group = Student.where("group_id is NULL and account_type = ?", "student")
  end

  def lessons
    @lessons = Group.group_lessons
  end

  private

    def group_teacher_params
      params.require(:group_teacher).permit(:teacher_id, :group_id) if params[:group_teacher]
    end

    def group_student_params
      params.require(:student).permit(:student_id, :group_id) if params[:student]
    end

    def group_lesson_params
      params.require(:group_lesson).permit(:lesson_id, :group_id) if params[:group_lesson]
    end

end
