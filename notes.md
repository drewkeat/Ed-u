# Project Notes
## Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [ ] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [ ] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [ ] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [ ] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup
- [ ] Include login
- [ ] Include logout
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

## Narrative
---

Ed-u is a catalog of courses and sessions for professional development.  Users create an account as on of three types; learner, facilitator, or admin.  Learners can browse the catalog and register for courses.  Facilitators can create courses with a "pending approval" status, view course registrations, and view personal and course reviews.  Admin can approve proposed courses, and view course and subordinate facilitator reviews.
---
## Routes and Experience

Root - **ed_u.com**
- As a guest, I want to see a login/create account form **ed_u.com/signup** or **ed_u.com/login**

User - **ed_u.com/users/:id**
- Show View
  - As a user, I want to see a list of upcoming trainings/sessions
  - I want to see links for:
  - Courses View
    - Finding a course **edu.com/courses**
      - Next to each course should be a button to enroll **edu.com/courses/:id/registrations/new**
    - Unenrolling - **ed_u.com/users/:id/registrations/:id/destroy**
    - Editing my profile **ed_u.com/users/:id/edit**
    - Deleting my account **ed_u.com/users/:id/destroy**
    - Logging out **ed_u.com/logout**

Finding a Session - 
- As a user, I want to see a list of all upcoming courses
  - I want to be able to filter, or search by keywords

Facilitator - **ed_u.com/users/:id**
- Show view
  - As a facilitator, I want to see a list of all of *my* upcoming courses with links and an enrollment count **ed_u.com/courses/:id**
  - As a facilitator, I want to have a button for creating a new course **ed_u.com/courses/new**
- Courses View
  - As a facilitator, I want to have a button for creating a new course **ed_u.com/courses/new**

## Models & Associations
---
Department
  - has_many :staff, class_name: "User"

User
  - has_many :courses, foreign_key: "facilitator_id"
  - has_many :registrations, foreign_key: "learner_id"
  - has_many :enrollments, through: :registrations, source: :course
  - has_many :subordinates, class_name: "User", foreign_key: "manager_id"
  - belongs_to :supervisor, class_name: "User"
  - belongs_to :department

Course
  - belongs_to :facilitator, class_name: "User"
  - has_many :registrations
  - has_many :learners, through: :registrations, source: :learner
  <!-- - has_many :sessions -->
  - has_many :reviews, as: :reviewable

Registration
  - belongs_to :course
  - belongs_to :learner, class_name: "User"

<!-- Session
  - belongs_to :course -->

Review
  - belongs_to :reviewable, polymorphic: true
  - belongs_to :reviewer, class_name: 'User', foreign_key: 'reviewer_id'

Tag

Course_Request