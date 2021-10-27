class CreateCalories < ActiveRecord::Migration[6.0]
  def change
    create_table :calories do |t|
      t.integer :calorie,           null: false
      t.string :food,           null: false
      t.string :memo
      t.datetime :start_time
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
