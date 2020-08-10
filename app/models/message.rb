class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  scope :recently_updated, -> { order(updated_at: :desc) }
end
