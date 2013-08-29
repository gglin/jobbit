## JOBBIT

### A Company Information Aggregator
Jobbit integrates with LinkedIn and Crunchbase to retrieve relevant info for job-seekers in tech.  
AngelList and Glassdoor integration pending...

##### To Get Started:

1. Fork/clone the repo
2. `bundle install`
3. `rake db:migrate`

##### Seeding:

1. `rake db:seed`
2. `rake import_company:crunchbase`   => *This will autopopulate all companies with Crunchbase data*
3. `rake import_company:linkedin`   => *This will autopopulate from LinkedIn, without overriding existing data*

*A few companies may not be seeded correctly due to the inexact nature of searching LinkedIn*  
*Manual edits may be required*  

##### Obtaining API Keys:

In order for your local application to talk to Crunchbase and LinkedIn, you will need to obtain API keys for these sites and store them in a new file: `/config/application.yml`  

An example of what this looks like can be found in `/config/application_example.yml`

API Keys can be obtained at:  
- [http://developer.crunchbase.com/page](http://developer.crunchbase.com/page)
- [https://www.linkedin.com/secure/developer](https://www.linkedin.com/secure/developer)


##### Testing:

Guard has been set, with Spork & notifications for OS X, for smooth & quick testing.  To run this with RSpec, simply type `guard` in the terminal.

*It may be necessary to disable authorization  in the CompaniesController to enable all tests to pass.  This fix is pending.*