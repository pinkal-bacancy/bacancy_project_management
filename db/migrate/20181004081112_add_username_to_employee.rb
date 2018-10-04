# frozen_string_literal: true

class AddUsernameToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :username, :string, unique: true
  end
end
