class Company < ActiveRecord::Base
  attr_accessible :name, :crunchbase_url, :glassdoor_url, :linkedin_url, :number_of_employees, :founded_year, :twitter_username, :website, :total_money_raised, :funding_rounds, :overview, :description, :notes, :num_followers, :industries
  attr_accessible :employees, :employee_ids

  has_many :employments
  has_many :employees, through: :employments

  validates_uniqueness_of :name, :case_sensitive => false
end
