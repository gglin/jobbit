class AddColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :description, :string
    add_column :companies, :total_money_raised, :string
    add_column :companies, :funding_rounds, :text

    add_column :companies, :num_of_1st_connections, :integer
    add_column :companies, :num_of_2nd_connections, :integer

    add_column :companies, :avg_glassdoor_rating,  :integer
    add_column :companies, :num_glassdoor_ratings, :integer

    add_column :companies, :notes, :text
  end
end
