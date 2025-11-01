class Department < ApplicationRecord
  belongs_to :university

  # Validations
  validates :name, presence: true, uniqueness: { scope: :university_id }
end
