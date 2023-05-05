class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.text :name
      t.text :description
      t.float :price
      t.text :duration
      t.timestamps
    end
  end
end