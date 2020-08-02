class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :albums
  has_many :comments
  has_many :likes
  has_many :liked_albums, through: :likes, source: :album
  # フォロー機能
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships,class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  validates :email, presence: true
  validates :name, presence: true
  validates :introduction, length: { maximum: 500}
  validates :is_active, inclusion: {in: [true, false]}

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def active_for_authentication?
    super && (self.is_active == true)
  end
end
