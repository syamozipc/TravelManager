class Inquiry < ApplicationRecord
	belongs_to :user

	enum deal: { backlog: 0, completed: 1 }

	validates :user_id, presence: true
	validates :title, presence: true, length: {maximum: 30}
	validates :content, presence: true, length: {maximum: 1000}

	scope :recently_updated, -> { order(updated_at: :desc) }
end
