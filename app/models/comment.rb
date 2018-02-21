class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :work
  
  validates :user_id, presence: true
  validates :work_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
