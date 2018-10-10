class AddIsPrimaryFieldToEmployee < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :is_primary, :boolean 
  end
end
