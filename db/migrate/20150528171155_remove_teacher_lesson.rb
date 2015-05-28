class RemoveTeacherLesson < ActiveRecord::Migration
  def change
    drop_table :teacher_lessons
  end
end
