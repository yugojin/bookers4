class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :book_comment, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  validates :name, presence: true, length: { minimum:2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
end
