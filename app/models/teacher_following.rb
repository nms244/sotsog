class TeacherFollowing < ApplicationRecord
  belongs_to :follow, class_name: 'Teacher'
  belongs_to :followed, class_name: 'Student'

  validates :follow_id, presence: true
  validates :followed_id, presence: true
end
