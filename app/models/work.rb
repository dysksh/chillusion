class Work < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :caption, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  
  has_many :comments
  has_many :comment_works, through: :comments, source: :work

  def comment(work, content)
    self.comments.create(work_id: work.id, content: content)
  end
  
end
