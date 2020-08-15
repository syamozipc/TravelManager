class Comment < ApplicationRecord
	belongs_to :album
	belongs_to :user
	has_many :notifications, dependent: :destroy

	validates :user_id, presence: true
	validates :album_id, presence: true
	validates :content, presence: true, length: {maximum: 100}

	default_scope -> { order(updated_at: :desc) }
end
