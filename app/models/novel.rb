class Novel < ApplicationRecord
  has_many :characters

  def self.sort_by_newest
    order('created_at DESC')
  end
end
