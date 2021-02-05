class RemoveNovelIdFromCharacters < ActiveRecord::Migration[5.2]
  def change
    remove_column :characters, :novel_id, :integer
  end
end
