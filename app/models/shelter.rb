class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  validates_presence_of :name, :address, :city, :state, :zip

  def self.sort_by_name_desc
    find_by_sql("SELECT * FROM shelters ORDER BY shelters.name desc")
  end

  def self.sort_by_name_asc
    find_by_sql("SELECT * FROM shelters ORDER BY shelters.name asc")
  end

  def self.find_by(id)
    find_by_sql("SELECT * FROM shelters WHERE shelters.id = #{id}")
  end

  def pending_apps?
    !pets.pending_apps.empty?
  end
end
