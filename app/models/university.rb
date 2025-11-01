class University < ApplicationRecord
  has_many :programs, dependent: :destroy

  validates :name, presence: true
  validates :country, presence: true
end
