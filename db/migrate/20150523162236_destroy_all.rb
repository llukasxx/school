class DestroyAll < ActiveRecord::Migration
  def change
    drop_table :admin_workers
    drop_table :students
    drop_table :teachers
  end
end
