class RemoveLibraryIdFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :library_id, :integer
  end
end
