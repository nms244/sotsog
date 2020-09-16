class Room < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  has_many :messages
end
