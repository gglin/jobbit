class Company < ActiveRecord::Base
  attr_accessible :crunchbase_url, :founded_year, :glassdoor_url, :linkedin_url, :name, :number_of_employees, :overview, :twitter_username, :website

  validates :name, presence: true
end
