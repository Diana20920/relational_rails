class CreateCharacter < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :novel_id
      t.string :name
      t.boolean :antagonist
      t.integer :age
      t.datetime :updated_at
      t.datetime :created_at
    end
  end
end
