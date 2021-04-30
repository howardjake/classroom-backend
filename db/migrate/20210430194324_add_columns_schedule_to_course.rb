class AddColumnsScheduleToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :schedule, :string
  end
end
