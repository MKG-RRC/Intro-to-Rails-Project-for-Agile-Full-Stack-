class University < ApplicationRecord
  has_many :programs, dependent: :destroy
  has_many :departments, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :country, presence: true
end
