class Employee < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :twitter

  has_many :employments
  has_many :companies, through: :employments
end
