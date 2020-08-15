class Album < ApplicationRecord

	enum range: { closed: 0, open: 1 }

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :photos, dependent: :destroy
	accepts_attachments_for :photos, attachment: :image
	has_many :notifications, dependent: :destroy
	belongs_to :user
	belongs_to :destination

	validates :user_id, presence: true
	validates :destination_id, presence: true
	validates :title, presence: true, length: {maximum: 30}
	validates :discription, presence: true, length: {maximum: 1000}
	validates :range, presence: true

	scope :recently_updated, -> { order(updated_at: :desc) }
	scope :publicly_open, -> { where(range: "open")}

	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	def create_notification_like!(current_user)
		temp = Notification.where(["visitor_id = ? & visited_id = ? & album_id = ? & action = ? ", current_user.id, user_id, id, 'like'])
		if temp.blank?
			notification = current_user.active_notifications.new(
			album_id: id,
			visited_id: user_id,
			action: 'like'
			)
			if notification.visitor_id == notification.visited_id
				notification.checked = true
			end
			notification.save if notification.valid?
		end
	end

	def create_notification_comment!(current_user, comment_id)
		temp_ids = Comment.select(:user_id).where(album_id: id).where.not(user_id: current_user.id).distinct
		temp_ids.each do |temp_id|
			save_notification_comment!(current_user, comment_id, temp_id['user_id'])
		end
		save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
	end

	def save_notification_comment!(current_user, comment_id, visited_id)
		notification = current_user.active_notifications.new(
     		album_id: id,
    	  	comment_id: comment_id,
    	  	visited_id: visited_id,
    	  	action: 'comment'
   		)
		if notification.visitor_id == notification.visited_id
      		notification.checked = true
    	end
    	notification.save if notification.valid?
	end
end
