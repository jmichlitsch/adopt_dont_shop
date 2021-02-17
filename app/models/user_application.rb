class UserApplication < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
    has_many :pets, through: :pet_applications
    validates :name, :city, presence: true
    validates :state, length: {maximum: 2}, presence: true
    validates :zip, numericality: true, presence: true

end
