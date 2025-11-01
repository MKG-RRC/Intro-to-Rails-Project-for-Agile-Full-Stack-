# db/seeds.rb
# ------------------------------------------------------------
# Purpose: Populate the database with sample data for testing
# and demonstration (Feature 1.7 – Data Sources).
# Generates Universities, Departments, Programs, and Instructors.
# ------------------------------------------------------------

require "faker"

puts "🧹 Cleaning existing data..."
Instructor.destroy_all
Department.destroy_all
Program.destroy_all
University.destroy_all

puts "🌱 Seeding universities, programs, departments, and instructors..."

20.times do
  university = University.create!(
    name: Faker::University.unique.name,
    country: Faker::Address.country
  )

  # --- Departments (3 per university)
  3.times do
     dept_name = Faker::Educator.subject
   Department.find_or_create_by!(
    name: dept_name,
    university: university
    )
  end

  # --- Programs (10 per university)
  10.times do
    program = Program.create!(
      name: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      university: university
    )

    # --- Instructors (2–3 per program)
    rand(2..3).times do
      instructor = Instructor.find_or_create_by!(
        email: Faker::Internet.unique.email
      ) do |i|
        i.name = Faker::Name.name
      end

      program.instructors << instructor unless program.instructors.include?(instructor)
    end
  end
end

puts "✅ Done seeding!"
puts "Universities: #{University.count}"
puts "Departments:  #{Department.count}"
puts "Programs:     #{Program.count}"
puts "Instructors:  #{Instructor.count}"
puts "Total Records: #{University.count + Department.count + Program.count + Instructor.count}"
