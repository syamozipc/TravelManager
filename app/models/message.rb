class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :content, presence: true, length: {maximum: 300}

  default_scope -> { order(updated_at: :desc) }
end
