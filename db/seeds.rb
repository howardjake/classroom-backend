# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create(assignments:[], period:"Computer Science")
course = Course.find(1)

30.times do
    course.students.create(
        name: Faker::TvShows::FamilyGuy.character,
        email: Faker::Internet.email,
        comment: "new student"
    )   
end

students = Student.all

students.each do |student|
    student.assignments.create([
        {
        name: "JS",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 14),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "Ruby",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 21),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "HTML",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 2),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "CSS",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 5),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "Data Structure",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 21),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "Algorithms",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 21),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "Python",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 14),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "C++",
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 10),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    ])
end

course_assigments = Assignment.all
all_assign = []

course_assigments.map do |assignment|
    all_assign.push(assignment[:name])
    all_assign.uniq!
end
 
course.update(assignments: all_assign)