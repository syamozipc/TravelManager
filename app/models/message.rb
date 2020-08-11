class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true, length: {maximum: 300}

  scope :recently_updated, -> { order(updated_at: :desc) }
end
