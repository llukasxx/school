class AddNameSurnameToAdminWorkers < ActiveRecord::Migration
  def change
    add_column :admin_workers, :name, :string
    add_column :admin_workers, :surname, :string
  end
end
