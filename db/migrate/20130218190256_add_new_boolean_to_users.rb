class AddNewBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :new, :boolean, :null => false, :default => true
  end
end
