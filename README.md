# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Docker environment

- Ruby version : v2.7
- Rails version : v6

# To build the docker image

- Run `docker compose build` to build docker image
- First time setup Run `docker compose run web rails db:create db:migrate` to create the database and tables
- First time setup: Run `docker compose run web rails webpacker:install` to install webpacker because Rails 6 requires it
- After running the last command: Run `docker compose up --build` to rebuild the image
- Run `docker compose up -d` to run in rails app in the background

# To run the test suite
- Run `docker compose run web bundle exec rspec`