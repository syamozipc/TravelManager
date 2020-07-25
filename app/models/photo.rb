class Photo < ApplicationRecord
	
	attachment :image

	belongs_to :album

	validates :album_id, presence: true
	validates :image, presence: true
end
