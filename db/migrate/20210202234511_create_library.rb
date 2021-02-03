class CreateLibrary < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.boolean :online_membership
      t.integer :current_employees
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
