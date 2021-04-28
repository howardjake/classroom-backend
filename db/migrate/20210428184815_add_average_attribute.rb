class AddAverageAttribute < ActiveRecord::Migration[6.1]
  def change
    add_column :assignment_masters, :average, :integer
  end
end
