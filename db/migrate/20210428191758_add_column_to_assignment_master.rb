class AddColumnToAssignmentMaster < ActiveRecord::Migration[6.1]
  def change
    add_column :assignment_masters, :due_date, :date
  end
end
