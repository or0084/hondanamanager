class Tag < ApplicationRecord
  
  has_many :tag_books, dependent: :destroy
  has_many :books, through: :book_tags
  validates :name, uniqueness: true
  
end
