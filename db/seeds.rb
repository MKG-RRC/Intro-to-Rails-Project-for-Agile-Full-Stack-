# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

Program.delete_all
University.delete_all

puts "Seeding universities and programs..."

20.times do
  u = University.create!(
    name: Faker::University.name,
    country: Faker::Address.country
  )

  10.times do
    Program.create!(
      name: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      university: u
    )
  end
end

puts "Done! Universities: #{University.count}, Programs: #{Program.count}"
