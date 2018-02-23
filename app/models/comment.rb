class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :work, optional: true
  
  validates :user_id, presence: true
  validates :work_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
