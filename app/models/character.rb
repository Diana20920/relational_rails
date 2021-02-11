class Character < ApplicationRecord
  belongs_to :novel

  def self.all_true
    Character.where(antagonist: true)
  end
end
