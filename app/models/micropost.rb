class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end  
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
