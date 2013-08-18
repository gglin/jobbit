class Employment < ActiveRecord::Base
  attr_accessible :company_id, :employee_id, :title

  belongs_to :company
  belongs_to :employee
  
end
