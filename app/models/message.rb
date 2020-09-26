class Message < ApplicationRecord
  belongs_to :room

  validates :content, length: { maximum: 200 }

  mount_uploader :image, ImageUploader
end
