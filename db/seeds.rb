# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
    name: "Administrator",
    email: "admin@email.com",
    password: "password",
    access: "admin"
)

User.create(
    name: "Facilitator",
    email: "facilitator@email.com",
    password: "password",
    access: "facilitator"
)

User.create(
    name: "Learner",
    email: "learner@email.com",
    password: "password",
    access: "learner"
)