class CreateUniversities < ActiveRecord::Migration[7.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
