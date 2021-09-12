# README

## Description
Ed-U is a catalog of courses and sessions for professional development.  Users create an account and are assigned one of three types; learner, facilitator, or admin.  Learners can browse the catalog, register for courses, and review them once the course has happened.  Facilitators can create courses with a "pending approval" status, view/edit course registrations, and view reviews for their courses and reviews from their supervisor.  Admin can approve proposed courses, and view course reviews and provide feedback to employees (facilitators).

## Installation
To use this app, clone this repository, change directories into /edu. Run `rails db:create`, `rails db:migrate`, `rails db:seed`, and then `rails s`. Then navigate to localhost:3000.  All seed accounts have accounts associated with their status e.g. "administrator1@email.com", and passwords as "password".
## Use
Once you navigate to localhost:3000, you should see a welcome screen that will allow you to create an account or login traditionally or with Google.  If you seeded the database, you may log into any one of the seed accounts (e.g. "administrator1@email.com) with the password "password".  
Various menus and options are available depending on user access level, which can be assigned by an administrator account.  A rough breakdown of the workflow can be seen below:
- Facilitator creates courses
- Administrator approves "pending" courses created by facilitators
- Learners can register for upcoming, approved courses in the Course Catalog
- Once a course has occured, a learner can review a course.
- Faciltators can view course reviews and approve/edit course registrations for attendance.
- Administrators can provide professional reviews for employees.
- Facilitators can review professional reviews.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/drewkeat/Ed-u. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Further Information:

Project demo:
[Video Walkthrough](https://youtu.be/Q2wzUF_72Q0)

[Associated Blog](https://drewjkeat.medium.com/rails-user-authorizations-12d9b3659636)