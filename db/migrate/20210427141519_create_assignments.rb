class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :grade
      t.date :due_date
      t.date :date_submitted
      t.boolean :resubmit
      t.string :comment

      t.timestamps
    end
  end
end
