# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create(
    assignments:[], period:"Computer Science", 
    uid: "gdjfvbkdovv6489820fm", 
    start_date: "2021-03-02",
    end_date: "2021-11-06",
    schedule: [
        "Monday 2pm - 4:30pm",
        "Tuesday 2pm - 4:30pm",
        "Wednesday 2pm - 4:30pm",
        "Thursday 2pm - 4:30pm",
        "Friday 2pm - 4:30pm",
                ])
course = Course.find(1)

30.times do
    course.students.create(
        name: Faker::TvShows::FamilyGuy.character,
        email: Faker::Internet.email,
        comment: "new student",
    )   
end

course.assignment_masters.create([
    {
    name: "JS",
    description: "do the thing!",
    due_date: Faker::Date.forward(days: 14)
},
    {
    name: "Ruby",
    description: "do the thing!",
    due_date: Faker::Date.forward(days: 14)
},
    {
    name: "Python",
    description: "do the thing!",
    due_date: Faker::Date.forward(days: 14)
},
    {
    name: "HTML",
    description: "do the thing!",
    due_date: Faker::Date.forward(days: 14)
},
])

students = Student.all

masters = AssignmentMaster.all

masters.each do |master|
        id = master.id
        name = master.name
        due_date = master.due_date
    students.each do |student| 
        student.assignments.create({
        name: name,
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: due_date,
        date_submitted: nil,
        resubmit: false,
        comment: nil,
        assignment_master_id: id
    })
   end
end

# students.each do |student|
#     student.assignments.create([
#         {
        # name: "JS",
        # grade: Faker::Number.between(from: 52, to: 102),
        # due_date: Faker::Date.forward(days: 14),
        # date_submitted: nil,
        # resubmit: false,
        # comment: nil,
#     }, {
#         name: "Ruby",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 21),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }, {
#         name: "HTML",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 2),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }, {
#         name: "CSS",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 5),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }, {
#         name: "Data Structure",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 21),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }, {
#         name: "Algorithms",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 21),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }, {
#         name: "Python",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 14),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }, {
#         name: "C++",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 10),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil
#     }
#     ])
# end

course_assigments = Assignment.all
all_assign = []

course_assigments.map do |assignment|
    all_assign.push(assignment[:name])
    all_assign.uniq!
end
 
course.update(assignments: all_assign)

# students.each do |student|
#     student.assignments.create(
#         {
#         name: "JS",
#         grade: Faker::Number.between(from: 52, to: 102),
#         due_date: Faker::Date.forward(days: 14),
#         date_submitted: nil,
#         resubmit: false,
#         comment: nil,
#         assignment_master_id: master.id
#     })
# end

# Assignment.where(assignment_master_i
#     d: 1).destroy_all