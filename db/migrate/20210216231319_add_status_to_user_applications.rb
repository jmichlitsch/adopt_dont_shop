class AddStatusToUserApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :user_applications, :status, :string, :default => "In Progress"
  end
end
