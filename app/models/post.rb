class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
  validate :image_size
  has_many :likes, dependent: :destroy
  has_many :good_users, through: :likes, source: :user

  def good(user)
    likes.create(user_id: user.id)
  end

  def not_good(user)
    likes.find_by(user_id: user.id).destroy
  end

  def good?(user)
    good_users.include?(user)
  end

  private

    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "5MB未満である必要があります")
      end
    end
end    