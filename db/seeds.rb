# db/seeds.rb
# ------------------------------------------------------------
# Purpose: Populate the database with sample data for testing
# and demonstration (Feature 1.7 – Data Sources).
# Generates Universities, Departments, Programs, and Instructors.
# Includes coordinates for map visualization (Feature 3.6).
# ------------------------------------------------------------

require "faker"

# --- Approximate coordinates for well-known universities ---
UNIVERSITY_COORDS = {
  "University of Toronto" => [43.6629, -79.3957],
  "Harvard University" => [42.3770, -71.1167],
  "University of Oxford" => [51.7548, -1.2544],
  "University of Tokyo" => [35.7126, 139.7610],
  "University of Melbourne" => [-37.7963, 144.9614],
  "ETH Zurich" => [47.3769, 8.5417],
  "National University of Singapore" => [1.2966, 103.7764],
  "University of the Philippines Diliman" => [14.6548, 121.0648],
  "University of Cape Town" => [-33.9570, 18.4604],
  "University of São Paulo" => [-23.5614, -46.7308],
  "Default" => [0, 0]
}

puts "🧹 Cleaning existing data..."
Instructor.destroy_all
Department.destroy_all
Program.destroy_all
University.destroy_all

puts "🌱 Seeding universities, programs, departments, and instructors..."

# --- Seed 10 known universities (from hash) ---
UNIVERSITY_COORDS.each do |name, coords|
  next if name == "Default"

  university = University.create!(
    name: name,
    country: Faker::Address.country,
    latitude: coords[0],
    longitude: coords[1]
  )

  # --- Departments (3 per university) ---
  3.times do
    dept_name = Faker::Educator.subject
    Department.find_or_create_by!(
      name: dept_name,
      university: university
    )
  end

  # --- Programs (5 per university) ---
  5.times do
    program = Program.create!(
      name: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      university: university
    )

    # --- Instructors (2–3 per program) ---
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

# --- Add 10 random Faker universities to reach 20 total ---
10.times do
  university = University.create!(
    name: Faker::University.unique.name,
    country: Faker::Address.country,
    latitude: rand(-60.0..60.0), # 🌍 random realistic lat
    longitude: rand(-150.0..150.0) # 🌍 random realistic lng
  )

  # --- Departments (3 per university) ---
  3.times do
    dept_name = Faker::Educator.subject
    Department.find_or_create_by!(
      name: dept_name,
      university: university
    )
  end

  # --- Programs (5 per university) ---
  5.times do
    program = Program.create!(
      name: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      university: university
    )

    # --- Instructors (2–3 per program) ---
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
