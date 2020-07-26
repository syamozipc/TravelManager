class Album < ApplicationRecord

	enum range: { closed: 0, open: 1 }

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :photos, dependent: :destroy
	belongs_to :user
	belongs_to :destination

	validates :user_id, presence: true
	validates :destination_id, presence: true
	validates :title, presence: true
	validates :discription, presence: true, length: {maximum: 1000}
	validates :range, presence: true
end
