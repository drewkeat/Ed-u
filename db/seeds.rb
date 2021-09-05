# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_users
    @admin1 = User.create(
        name: "Administrator1",
        email: "admin1@email.com",
        password: "password",
        access: "admin"
    )

    @admin2 = User.create(
        name: "Administrator2",
        email: "admin2@email.com",
        password: "password",
        access: "admin"
    )

    @admin3 = User.create(
        name: "Administrator3",
        email: "admin3@email.com",
        password: "password",
        access: "admin"
    )

    @f1 = User.create(
        name: "Facilitator1",
        email: "facilitator1@email.com",
        password: "password",
        access: "facilitator"
    )

    @f2 = User.create(
        name: "Facilitator2",
        email: "facilitator2@email.com",
        password: "password",
        access: "facilitator"
    )

   @f3 = User.create(
        name: "Facilitator3",
        email: "facilitator3@email.com",
        password: "password",
        access: "facilitator"
    )

    @l1 = User.create(
        name: "Learner1",
        email: "learner1@email.com",
        password: "password",
        access: "learner"
    )

    @l2 = User.create(
        name: "Learner2",
        email: "learner2@email.com",
        password: "password",
        access: "learner"
    )

    @l3 = User.create(
        name: "Learner3",
        email: "learner3@email.com",
        password: "password",
        access: "learner"
    )
end

def create_courses
    start_time = Time.now + 10.days
    @c1 = Course.create(name: "Course One", description: Faker::Lorem.sentences(number: rand(1..10)).join(" "), start_time: start_time , end_time: start_time + rand(60..120).minutes)
    start_time = Time.now - 10.days
    @c2 = Course.create(name: "Course Two", description: Faker::Lorem.sentences(number: rand(1..10)).join(" "), start_time: start_time , end_time: start_time + rand(60..120).minutes)
     start_time = Time.now + 3.days
    @c3 = Course.create(name: "Course Three", description: Faker::Lorem.sentences(number: rand(1..10)).join(" "), start_time: start_time, end_time: start_time + rand(60..120).minutes)

    @f1.courses << @c1
    @f2.courses << @c2
    @f3.courses << @c3

    @f1.save
    @f2.save
    @f3.save
end

def enroll_learners
    @l1.enrollments << [@c1, @c2]
    @l2.enrollments << [@c2, @c3]
    @l3.enrollments << [@c1, @c3]
end

create_users
create_courses
enroll_learners