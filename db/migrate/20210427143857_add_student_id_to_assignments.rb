class AddStudentIdToAssignments < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :student_id, :integer
  end
end
