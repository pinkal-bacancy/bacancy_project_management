class RemovePrimaryTechnologyFromEmployee < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :primary_technology, :text
  end
end
