class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_email
      t.string :client_contact
      t.string :country

      t.timestamps
    end
  end
end
