class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

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

  def followed_by?(user) #ログインユーザーにフォローされているかどうかの確認
    passive_relationships.find_by(following_id: user.id).present?
  end

  def liked_by?(user) #ログインユーザーのいいねの有無の確認
    likes.where(user_id: user.id).exists?
  end

  def active_for_authentication? #ログイン時に退会済みユーザーかどうかの確認
    super && (self.is_active == true)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
