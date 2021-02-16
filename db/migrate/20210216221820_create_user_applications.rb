class CreateUserApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :user_applications do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :description
      t.string :status
    end
  end
end
