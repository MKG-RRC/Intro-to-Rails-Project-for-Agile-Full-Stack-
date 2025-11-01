class Program < ApplicationRecord
  belongs_to :university
  has_and_belongs_to_many :instructors

  # Validations
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
end
