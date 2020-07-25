class Relationship < ApplicationRecord

	validates :following_id, presence: true
	validates :follower_id, presence: true
end
