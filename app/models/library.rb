class Library < ApplicationRecord
  has_many :books

  def self.sort_by_newest
    order('created_at DESC')
  end
end
