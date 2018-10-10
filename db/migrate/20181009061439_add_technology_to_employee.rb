class AddTechnologyToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :technology, foreign_key: true
  end
end
