class Book < ApplicationRecord
  belongs_to :library

  def self.all_true
    Book.where(audio_book: true)
  end


end
