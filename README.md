T3A2-A Full Stack App (PART A): GitHub repository: https://github.com/Ellezique/Full-Stack-App-PART-A


#### SETUP
1. Clone this repository to your local
2. Open your command line (terminal) and navigate to the directory where you saved the clone in your local environment.
3. Install dependencies by running the following in your command line terminal: `$ bundle install`
4. Open the directory in your default text editor: `$ code .`
5. Open your database.yml file and customise the following to your specifications (username, password, host and port)
6. Setup the database and populate preset data from the seeds file by running the following commands in terminal: `$rails db:reset`, `$rails db:migrate` ,
`$rails db:seed`
7. Start your server by running: `$ rails s`.
Open the following url in your browser: http://localhost:8000/
The page should load without error.

To reset Heroku postgreSQL database
-  `$ heroku pg:reset DATABASE_URL`
-  `$ heroku run rake db:migrate ` 
- `$ heroku run rake db:seed`