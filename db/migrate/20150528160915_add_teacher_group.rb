class AddTeacherGroup < ActiveRecord::Migration
  def change
    create_table :group_teachers do |t|
      t.integer :group_id
      t.integer :teacher_id
 
      t.timestamps null: false
    end

    add_index :group_teachers, :group_id
    add_index :group_teachers, :teacher_id
  end
end
