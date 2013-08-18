class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.string :uid

      t.timestamps
    end
  end
end
