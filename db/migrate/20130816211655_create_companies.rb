class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :crunchbase_url
      t.string :linkedin_url
      t.string :glassdoor_url
      t.string :twitter_username
      t.string :number_of_employees
      t.string :founded_year
      t.text :overview

      t.timestamps
    end
  end
end
