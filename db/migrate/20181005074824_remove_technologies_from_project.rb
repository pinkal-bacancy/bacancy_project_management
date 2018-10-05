class RemoveTechnologiesFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :technologies, :string
  end
end
