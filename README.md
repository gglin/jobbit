## JOBBIT

### A Company Information Aggregator
Jobbit integrates with LinkedIn and Crunchbase to retrieve relevant info for job-seekers in tech
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

##### Testing:

Guard has been set, with Spork & notifications for OS X, for smooth & quick testing.  To run this with RSpec, simply type `guard` in the terminal.