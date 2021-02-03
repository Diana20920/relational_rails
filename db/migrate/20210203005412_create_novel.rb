class CreateNovel < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.string :title
      t.string :author
      t.boolean :hard_cover
      t.integer :number_of_chapters
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
