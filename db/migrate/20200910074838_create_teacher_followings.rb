class CreateTeacherFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_followings do |t|
      t.references :follow, foreign_key: {to_table: :teachers}
      t.references :followed, foreign_key: {to_table: :students}

      t.timestamps

      t.index [:follow_id, :followed_id], unique: true
    end
  end
end
