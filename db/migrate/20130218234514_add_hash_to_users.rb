class AddHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_hash, :string
  end
end
