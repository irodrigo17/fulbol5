# Futbol 5

Very simple Rails app to help organize our weekly soccer games.

The basic idea is to automatically create matches every week and email players a link to join.


## Tech stuff

Using Ruby 2.1.5 and Rails 4.2.0 as defined in the Gemfile.

Using a PostgreSQL database, running on the default port for local development and testing.

There's a Gmail account setup for development in `config/environments/development.rb`.

Default players are seeded into the database using `db/seeds.rb`.

Tests are run with the default `rake test` job.

The app is deployed to Heroku at [fulbol.herokuapp.com](https://fulbol.herokuapp.com).


## TODOs

- [ ] Define weekly CRON job for creating matches and sending emails, check [whenever](https://github.com/javan/whenever)
- [ ] Localize for Spanish language, check [I18n](http://guides.rubyonrails.org/i18n.html)
- [ ] Setup [TravisCI](https://travis-ci.org/)
- [ ] Setup [Code Climate](https://codeclimate.com)
- [ ] Improve UI
