class AddColumnCourseIdtoAssignmentMaster < ActiveRecord::Migration[6.1]
  def change
    add_column :assignment_masters, :course_id, :integer
  end
end
