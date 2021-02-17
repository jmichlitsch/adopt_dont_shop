class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :description, :approximate_age, :sex
  has_many :pet_applications, dependent: :destroy
  has_many :user_applications, through: :pet_applications
  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.search(search)
      key = "%#{search}%".downcase
      where("LOWER(name) like :search", search: key)
  end
end
