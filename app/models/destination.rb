class Destination < ApplicationRecord
	has_many :album

	validates :place, presence: true
end
