# Touiteur

Imitation of Twitter.

## Install

* With HTTPS

`git clone https://github.com/Poulpy/Touiteur.git`

* With SSH

`git clone git@github.com:Poulpy/Touiteur.git`

You can also download the .zip from the github repository.

* Install gems

`bundle install`

* Run migrations

`rake db:create`

`rake db:migrate`

`rake db:seed`

* Start server

`rails server`

Enter the following URL in your web browser

`localhost:3000/`

## Configuration

Ruby  : 2.6.0
Rails : 5.2.3

## TODOS

- Solve security issues
- Full Turbolinks
- Better performance (queries)
- docker
- Better navbar
- Better everything

### Notes

To enable UUID :

install the gem `pgcrypto`

Then do in psql :

`CREATE EXTENSION pgcrypto;`

