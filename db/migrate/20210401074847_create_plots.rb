class CreatePlots < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.text :bio
      t.string :full_name
      
      t.timestamps
    end
  end
end
