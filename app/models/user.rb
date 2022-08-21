class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :image


  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  validates :name, presence: true, length: {minimum:2, maximum:20 }
  validates :email, presence: true
  validates :introduction ,length: {maximum:100}


  def active_for_authentication?
    super && (self.is_active == false)
  end


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
     user.name = 'ゲスト'
    end
  end


  def get_profile_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
