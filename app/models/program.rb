class Program < ApplicationRecord
  belongs_to :university

  validates :name, presence: true
end
