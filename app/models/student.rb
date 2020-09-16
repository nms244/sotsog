class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_many :student_followings, foreign_key: 'follow_id', dependent: :destroy
  has_many :teacher_followings, foreign_key: 'followed_id', dependent: :destroy
  has_many :followings, through: :student_followings, source: :followed
  has_many :followers, through: :teacher_followings, source: :follow
  has_many :rooms

  mount_uploader :icon, IconUploader

  def follow(teacher)
    self.student_followings.find_or_create_by(followed_id: teacher.id)
  end

  def unfollow(teacher)
    relationship = self.student_followings.find_by(followed_id: teacher.id)
    relationship.destroy if relationship
  end

  def already_following?(teacher)
    self.followings.include?(teacher)
  end

  def already_followed?(teacher)
    self.followers.include?(teacher)
  end

end
