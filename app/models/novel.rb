class Novel < ApplicationRecord
  has_many :characters

  def self.sort_by_newest
    order('created_at DESC')
  end

  def characters_count
    characters.count
  end

  def given_limit(treshold)
    characters.where("age > ?", treshold.to_i)
  end
end
