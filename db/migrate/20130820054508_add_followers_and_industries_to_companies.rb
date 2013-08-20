class AddFollowersAndIndustriesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :num_followers, :integer
    add_column :companies, :industries,    :string
  end
end
