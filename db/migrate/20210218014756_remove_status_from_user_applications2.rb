class RemoveStatusFromUserApplications2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_applications, :status, :integer
    add_column :user_applications, :status, :string, :default => "In Progress"
  end
end
