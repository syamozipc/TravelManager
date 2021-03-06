class Like < ApplicationRecord
	belongs_to :album
	belongs_to :user

	validates :user_id, presence: true
	validates :album_id, presence: true
	validates_uniqueness_of :album_id, scope: :user_id
end
