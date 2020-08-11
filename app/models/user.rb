class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  attachment :image

  has_many :albums, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_albums, through: :likes, source: :album
  has_many :inquiries, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships,class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries

  validates :email, presence: true, length: { maximum: 50}
  validates :name, presence: true, length: { maximum: 20}
  validates :introduction, length: { maximum: 100}
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

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        image: auth.info.image
      )
    end
 
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
