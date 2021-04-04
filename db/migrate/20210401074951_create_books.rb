class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
    
      t.string :storyline
      t.integer :reader_id
      t.integer :author_id
      t.timestamps
    end
  end
end
