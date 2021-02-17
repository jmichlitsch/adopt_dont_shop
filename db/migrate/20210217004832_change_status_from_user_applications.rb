class ChangeStatusFromUserApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_applications, :status
    add_column :user_applications, :status, :integer, :default => 0
  end
end
