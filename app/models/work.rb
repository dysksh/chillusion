class Work < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :caption, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  mount_uploader :audio, AudioFileUploader
  mount_uploader :video, VideoUploader
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_works, through: :favorites, source: :work, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  has_many :comment_works, through: :comments, source: :work, dependent: :destroy

  def comment(work, content)
    self.comments.create(work_id: work.id, content: content)
  end
  
end
