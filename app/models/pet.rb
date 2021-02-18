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

  def self.pending_apps
    select("DISTINCT ON (pets.name) pets.name, user_applications.id as app_id")
    .joins(pet_applications: [:user_application])
  end

  def self.action_required
    self.joins("INNER JOIN adoptions ON pet_applications.pet_id = pets.id AND pet_applications.status = NULL")
  end

  def self.avg_age
    average(:approximate_age)
  end

  def self.adoptable_count
    where(adoptable: true).count
  end

  def self.adopted_count
    where(adoptable: false).count
  end
end
