class RemoveSecondaryTechnologyFromEmployee < ActiveRecord::Migration[5.2]
  def change
  	remove_column :employees, :secondary_technology
  end
end
