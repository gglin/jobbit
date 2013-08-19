# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

filename = "db/sciencefair_attendees.csv"

CSV.foreach(filename) do |row|
  unless row[0] == "First Name"
    first_name   = row[0]
    last_name    = row[1]
    company_name = row[2]
    job_title    = row[3]

    # employee = Employee.new(first_name: first_name, last_name: last_name)
    # employee.save

    company = Company.find_or_create_by_name(company_name)
    company.save

    employee = company.employees.build(first_name: first_name, last_name: last_name)
    employee.save

    employment = Employment.where(employee_id: employee.id, company_id: company.id).take!
    employment.title = job_title
    employment.save
  end
end