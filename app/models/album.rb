class Album < ApplicationRecord

	enum range: { closed: 0, open: 1 }

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos
	accepts_attachments_for :photos, attachment: :photos
	belongs_to :user
	belongs_to :destination

	validates :user_id, presence: true
	validates :destination_id, presence: true
	validates :title, presence: true
	validates :discription, presence: true, length: {maximum: 1000}
	validates :range, presence: true

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
