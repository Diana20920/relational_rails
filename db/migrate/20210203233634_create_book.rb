class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :library_id
      t.string :title
      t.boolean :audio_book
      t.integer :copies_available
      t.datetime :updated_at
      t.datetime :created_at
    end
  end
end
