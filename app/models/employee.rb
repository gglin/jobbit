class Employee < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :twitter
  attr_accessible :companies, :company_ids

  has_many :employments
  has_many :companies, through: :employments
end
