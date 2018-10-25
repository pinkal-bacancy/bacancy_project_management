class RemoveIsPrimaryFromEmployee < ActiveRecord::Migration[5.2]
  def change
  	remove_column :employees, :is_primary
  end
end
