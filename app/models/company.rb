class Company < ActiveRecord::Base
  attr_accessible :crunchbase_url, :founded_year, :glassdoor_url, :linkedin_url, :name, :number_of_employees, :overview, :twitter_username, :website
  attr_accessible :employees, :employee_ids

  has_many :employments
  has_many :employees, through: :employments

  validates_uniqueness_of :name, :case_sensitive => false
end
