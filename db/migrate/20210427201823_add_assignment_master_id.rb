class AddAssignmentMasterId < ActiveRecord::Migration[6.1]
  def change
    add_column :assignments, :assignment_master_id, :integer
  end
end
