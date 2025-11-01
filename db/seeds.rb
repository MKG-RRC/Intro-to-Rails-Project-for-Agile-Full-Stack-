# db/seeds.rb
# ---------------------------------------------
# This seed file populates the database with
# Universities, their Programs, and Departments.
# It uses Faker to generate realistic sample data.
# ---------------------------------------------

require "faker"

# Clear existing data to avoid duplicates
puts "Cleaning database..."
Department.delete_all if defined?(Department)
Program.delete_all
University.delete_all

puts "Seeding universities, programs, and departments..."

20.times do
  university = University.create!(
    name: Faker::University.name,
    country: Faker::Address.country
  )

  # Seed Programs (one-to-many)
  10.times do
    Program.create!(
      name: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      university: university
    )
  end

  # Seed Departments (second one-to-many association)
  3.times do
    Department.create!(
      name: Faker::Educator.subject,
      university: university
    )
  end
end

puts "✅ Done!"
puts "Universities: #{University.count}"
puts "Programs: #{Program.count}"
puts "Departments: #{Department.count if defined?(Department)}"
