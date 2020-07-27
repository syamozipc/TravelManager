class Photo < ApplicationRecord
	
	belongs_to :album
	attachment :image

	validates :album_id, presence: true
	validates :image, presence: true
end
