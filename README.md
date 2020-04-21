# GymManagementSystem
Gym Management System made during project studio at AGH UST.

To develop:

- setup [Ruby](https://rubyinstaller.org/) version: 2.6.6
- setup [Rails](http://railsinstaller.org/en) version: 6.0
- install [yarn](https://classic.yarnpkg.com/en/docs/install#windows-stable)

Check versions in cmd, if they aren't proper launch Command Prompt with Ruby and from there make commands.

To run server: `rails s`

To create model, controller, view, migration: `rails generate [what] [name]`

Everytime you make changes to database you need to create new migration file, make changes there and perform migration.
To migrate database use: `rake db:migration`