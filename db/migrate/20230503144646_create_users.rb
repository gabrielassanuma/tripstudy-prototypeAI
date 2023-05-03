class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :questions
      t.timestamps
    end
  end
end