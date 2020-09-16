class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  validates :subject, length: { maximum: 100 }

  has_many :student_followings, foreign_key: 'followed_id', dependent: :destroy
  has_many :teacher_followings, foreign_key: 'follow_id', dependent: :destroy
  has_many :followings, through: :teacher_followings, source: :followed
  has_many :followers, through: :student_followings, source: :follow
  has_many :rooms

  mount_uploader :icon, IconUploader

  def follow(student)
    self.teacher_followings.find_or_create_by(followed_id: student.id)
  end

  def unfollow(student)
    relationship = self.teacher_followings.find_by(followed_id: student.id)
    relationship.destroy if relationship
  end

  def already_following?(student)
    self.followings.include?(student)
  end

  def already_followed?(student)
    self.followers.include?(student)
  end

end
