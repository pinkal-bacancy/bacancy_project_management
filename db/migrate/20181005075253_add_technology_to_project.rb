class AddTechnologyToProject < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :technology, foreign_key: true
  end
end
