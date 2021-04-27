class CreateAssignmentMasters < ActiveRecord::Migration[6.1]
  def change
    create_table :assignment_masters do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
