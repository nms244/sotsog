class StudentFollowing < ApplicationRecord
  belongs_to :follow, class_name: 'Student'
  belongs_to :followed, class_name: 'Teacher'

  validates :follow_id, presence: true
  validates :followed_id, presence: true
end
