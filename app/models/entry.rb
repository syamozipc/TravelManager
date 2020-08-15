class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room

  default_scope -> { order(updated_at: :desc) }
end
