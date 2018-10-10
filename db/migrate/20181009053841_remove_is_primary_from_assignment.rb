class RemoveIsPrimaryFromAssignment < ActiveRecord::Migration[5.2]
  def change
  	remove_column :assignments, :is_primary
  end
end
