class University < ApplicationRecord
  has_many :programs, dependent: :destroy
  has_many :departments, dependent: :destroy


  validates :name, presence: true
  validates :country, presence: true
end
