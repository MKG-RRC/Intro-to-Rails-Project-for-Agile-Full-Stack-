class CreateJoinTableInstructorsPrograms < ActiveRecord::Migration[7.1]
  def change
    create_join_table :instructors, :programs do |t|
      # t.index [:instructor_id, :program_id]
      # t.index [:program_id, :instructor_id]
    end
  end
end
