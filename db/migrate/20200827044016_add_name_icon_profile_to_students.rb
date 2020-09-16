class AddNameIconProfileToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :name, :string
    add_column :students, :icon, :string
    add_column :students, :profile, :text
  end
end
