class RemoveStatusFromUserApplications < ActiveRecord::Migration[5.2]
    def change
    remove_column :user_applications, :status, :string
  end
end
