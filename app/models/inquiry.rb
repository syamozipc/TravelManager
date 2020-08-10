class Inquiry < ApplicationRecord
	belongs_to :user

	enum deal: { backlog: 0, completed: 1 }

	validates :user_id, presence: true
	validates :title, presence: true
	validates :content, presence: true

	scope :recently_updated, -> { order(updated_at: :desc) }
end
