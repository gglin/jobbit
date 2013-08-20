namespace :import_company do

  desc "Import All Company Crunchbase Info"
  task :crunchbase => :environment do
    require 'mechanize'
    Company.all.each do |company|
      puts "#{company.id} #{company.name}"
      agent = Mechanize.new
      agent.get("http://localhost:3000/companies/#{company.id}/crunchbase")
      form = agent.page.forms.first
      form.submit
    end
  end

  desc "Import All Company LinkedIn Info"
  task :linkedin => :environment do
    require 'mechanize'
    Company.all.each do |company|
      puts "#{company.id} #{company.name}"
      agent = Mechanize.new
      agent.get("http://localhost:3000/companies/#{company.id}/linkedin")
      form = agent.page.forms.first
      form.submit
    end
  end

end

