class DestroyTeacherIdFromLessons < ActiveRecord::Migration
  def change
    remove_column :lessons, :teacher_id
  end
end
