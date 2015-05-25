class AddIndexToTeacherLessons < ActiveRecord::Migration
  def change
    add_index :teacher_lessons, :teacher_id
    add_index :teacher_lessons, :lesson_id  
  end
end
