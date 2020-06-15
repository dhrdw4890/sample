class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  validate :image_size
  has_many :comments, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "5MB未満である必要があります")
      end
    end
end    