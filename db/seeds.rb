# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_departments(number)
    i = 1
    number.times do
        department = Department.create(name: "Department #{i}")
        department.staff << create_staff(i)
        build_courses(department)
        enroll_learners
        approve_some_upcoming_courses
        i += 1
    end
end

def create_staff(i)
        a = 2*i-1
        f = 4*i-3
        l = 8*i-7
        staff = []
    2.times do
        name = "Administrator#{a}"
        admin = User.create(
            name: name,
            email: name.downcase+"@email.com",
            password: "password",
            access: "admin"
        )
        staff << admin
        2.times do
            name = "Facilitator#{f}"
            fac = User.create(
                name: name,
                email: name.downcase.split(" ").join(".")+"@email.com",
                password: "password",
                access: "facilitator"
            )
            fac.supervisor = admin
            fac.save
            staff << fac
            f += 1
        end
        a += 1
    end
    8.times do 
        name = "Learner#{l}"
        User.create(
            name: name,
            email: name.downcase+"@email.com",
            password: "password"
        )
        l += 1
    end
    return staff
end

def build_courses(department)
    facilitators = department.staff.facilitators
    facilitators.each do |fac|
    course_lengths = [0.5, 0.75, 1, 1.5, 2, 2.5, 3]
        fac.courses.build(
            name: Faker::Educator.course_name,
            description: Faker::Lorem.sentences(number: rand(5..15)).join(" "),
            start_time: start = Time.now + rand(5..10).days,
            end_time: start + course_lengths[rand(course_lengths.length)].hours
        )
        fac.courses.build(
            name: Faker::Educator.course_name,
            description: Faker::Lorem.sentences(number: rand(5..15)).join(" "),
            start_time: start = Time.now - rand(5..10).days,
            end_time: start + course_lengths[rand(course_lengths.length)].hours,
            status: "1"
        )
        fac.save
    end
end

def enroll_learners
    User.learners.each do |l|
        l.registrations.build(course_id: Course.upcoming[rand(Course.upcoming.length)].id)
        l.registrations.build(course_id: Course.past[rand(Course.past.length)].id)
        l.save
        l.enrollments.past.each do |course|
            course.reviews.build(reviewer_id: l.id, content: Faker::Lorem.sentences(number: rand(5..15)).join(" "))
            course.save
        end
    end
end

def approve_some_upcoming_courses
    Course.upcoming.count/3.times do 
        c = Course.upcoming[rand(Course.upcoming.length)]
        c.status = "1"
        c.save
    end
end

create_departments(3)