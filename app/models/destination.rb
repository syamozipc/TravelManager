class Destination < ApplicationRecord
	has_many :albums

	validates :place, presence: true
end
