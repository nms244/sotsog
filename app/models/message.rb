class Message < ApplicationRecord
  belongs_to :room

  mount_uploader :image, ImageUploader
end
