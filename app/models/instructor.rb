class Instructor < ApplicationRecord
  has_and_belongs_to_many :programs

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email" }
end
