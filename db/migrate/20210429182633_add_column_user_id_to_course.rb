class AddColumnUserIdToCourse < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :uid, :string
  end
end
