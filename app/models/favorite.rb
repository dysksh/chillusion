class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :work, optional: true
  
  validates :user_id, presence: true
  validates :work_id, presence: true
end
