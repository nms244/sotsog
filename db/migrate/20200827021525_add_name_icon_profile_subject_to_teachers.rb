class AddNameIconProfileSubjectToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :name, :string
    add_column :teachers, :icon, :string
    add_column :teachers, :profile, :text
    add_column :teachers, :subject, :text
  end
end
