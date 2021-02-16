class AddColumnsToPetApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_applications, :status, :string, :default => "In Progress"
  end
end
