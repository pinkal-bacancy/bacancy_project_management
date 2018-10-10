class AddBudgetToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :price, :integer
  end
end
