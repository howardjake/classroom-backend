class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :assignments, array: true
      t.string :period

      t.timestamps
    end
  end
end
