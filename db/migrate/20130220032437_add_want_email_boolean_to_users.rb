class AddWantEmailBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :want_email, :boolean, :default => true
  end
end
