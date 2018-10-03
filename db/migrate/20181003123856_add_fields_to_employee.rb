class AddFieldsToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :primary_technology, :text
    add_column :employees, :secondary_technology, :text
  end
end
