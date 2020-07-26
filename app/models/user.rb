class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :albums
  has_many :comments
  has_many :likes

  validates :email, presence: true
  validates :name, presence: true
  validates :introduction, length: { maximum: 500}
  validates :is_active, inclusion: {in: [true, false]}

  def active_for_authentication?
    super && (self.is_active == true)
  end
end
