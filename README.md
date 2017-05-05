### Rales Engine Project

##Description

This project was an API with 25+ endpoints created from multiple CSVs using Ruby 2.3+ and PostgreSQL containing data from Etsy.


## Setup

* 'git clone https://github.com/glassjoseph/rails_engine.git'
* 'cd rails_engine'
* remember to bundle!
* 'rake db:create db:migrate' to create the PostgreSQL database with proper migrations.
* 'rake data_import:csv_load' to seed all data.


## Testing

Run 'rspec' in your terminal to execute entire test suite.



## Running the Server

In the rales_engine directory run 'rails s' to boot up the server locally.
visit http://localhost:3000/ + your chosen API endpoint. (TODO: Document all API endpoints)
