class AddProviderAndUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
  end
end
