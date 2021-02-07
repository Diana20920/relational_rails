class Library < ApplicationRecord
  has_many :books

  def self.sort_by_newest
    order('created_at DESC')
  end

  def books_count
    books.count
  end

  def given_limit(threshold)
    books.where("copies_available > ?", threshold.to_i)
  end
end
