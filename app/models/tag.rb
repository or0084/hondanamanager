class Tag < ApplicationRecord

  has_many :tag_books, dependent: :destroy
  has_many :books, through: :tag_books
  validates :name, uniqueness: true

end
