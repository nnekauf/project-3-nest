class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :description
      t.date :completion_date
      t.integer :reader_id

      t.timestamps
    end
  end
end
