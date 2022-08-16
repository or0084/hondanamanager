class Book < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :book_comments, dependent: :destroy

  has_many :tag_books, dependent: :destroy
   has_many :tags, through: :tag_books


  has_one_attached :image
  
  
  validates :title, presence: true
  validates :body, presence: true
  validates :star, presence: true
  validates :genre_id, presence: true


  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


  def save_tags(savetag_books)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savetag_books
    new_tags = savetag_books - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    new_tags.each do |new_name|
      tag_book = Tag.find_or_create_by(name:new_name)
      self.tags << tag_book
    end
  end


  def self.search(keyword)
    where(["title like?", "%#{keyword}%"])
  end

end
