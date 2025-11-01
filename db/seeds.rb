require "faker"

puts "Cleaning old data..."
Instructor.delete_all
Department.delete_all
Program.delete_all
University.delete_all

puts "Seeding universities, programs, departments, and instructors..."

20.times do
  uni = University.create!(
    name: Faker::University.name,
    country: Faker::Address.country
  )

  # Departments
  3.times do
    Department.create!(
      name: Faker::Educator.subject,
      university: uni
    )
  end

  # Programs with instructors
  10.times do
    prog = Program.create!(
      name: Faker::Educator.course_name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      university: uni
    )

    # Create 2–3 instructors and link them
    rand(2..3).times do
      instr = Instructor.find_or_create_by!(
        email: Faker::Internet.unique.email,
        name: Faker::Name.name
      )
      prog.instructors << instr unless prog.instructors.include?(instr)
    end
  end
end

puts "✅ Done!"
puts "Universities: #{University.count}"
puts "Programs: #{Program.count}"
puts "Departments: #{Department.count}"
puts "Instructors: #{Instructor.count}"
