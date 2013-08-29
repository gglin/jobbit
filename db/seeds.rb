# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

sciencefair = "db/sciencefair_attendees.csv"
nycstartups = "db/NYC_startups.csv"

Company.delete_all
Employee.delete_all
Employment.delete_all

CSV.foreach(sciencefair) do |row|
  unless row[0] == "First Name"
    first_name   = row[0]
    last_name    = row[1]
    company_name = row[2]
    job_title    = row[3]

    company = Company.find_or_create_by_name(company_name)
    puts company.name + "\n"

    employee = company.employees.create(first_name: first_name, last_name: last_name)
    puts "#{employee.first_name} #{employee.last_name}"

    if job_title
      employment = Employment.where(employee_id: employee.id, company_id: company.id).first
      employment.title = job_title
      employment.save
    end
  end
end

CSV.foreach(nycstartups) do |row|
  industry = ""
  if row[0][0..2] == "## "
    industry = row[0][3..-1]
    puts "[\"#{industry}\"]"
  elsif row[0] != ""
    company_name = row[0]

    company = Company.find_or_create_by_name(company_name)
    company.industries = "[\"#{industry}\"]"
    company.save!
    puts company.name + "\n"
  end
end