# Test Management Application

This application is designed for creating, managing, and executing various tests. The tests consist of questions and answer options.

## Main Features

- Test creation and management
- Authentication
- Basic access control
- Test execution
- Publishing results on social networks

## User Groups

There are two user groups:

1. **Test Takers**: This group of users is responsible for selecting and taking tests.
2. **Test Administrators**: This group of users is responsible for creating and managing tests.

## Entities

The real-world objects represented in the application are:

- Test
- Question
- Answer
- Category
- Result
- User

## Ruby version

This application uses Ruby version 2.5.1.

## System dependencies

This application uses the following gems:

- Rails 5.2.1
- PostgreSQL (pg)
- Puma
- Sass for stylesheets (sass-rails)
- Uglifier for JavaScript assets compression
- CoffeeScript for .coffee assets and views (coffee-rails)
- Turbolinks for faster navigation
- Jbuilder for building JSON APIs
- Bootsnap for reducing boot times
- Octokit for GitHub API
- Devise for authentication
- Faraday for HTTP networking
- Rails-i18n and devise-i18n for localization
- jQuery, Bootstrap, and Octicons for UI

## Configuration

To configure the application, you need to set up the database and install all the dependencies. You can do this by running:

```bash
bundle install
rails db:setup
```
