class Comment < ApplicationRecord
	belongs_to :album
	belongs_to :user

	validates :user_id, presence: true
	validates :album_id, presence: true
	validates :content, presence: true, length: {maximum: 500}
end
