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
        grade: 0,
        due_date: Faker::Date.forward(days: 14),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }, {
        name: "Ruby",
        grade: 0,
        due_date: Faker::Date.forward(days: 21),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    }, {
        name: "HTML",
        grade: 0,
        due_date: Faker::Date.forward(days: 2),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    }, {
        name: "CSS",
        grade: 0,
        due_date: Faker::Date.forward(days: 5),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    }, {
        name: "Data Structure",
        grade: 0,
        due_date: Faker::Date.forward(days: 21),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    }, {
        name: "Algorithms",
        grade: 0,
        due_date: Faker::Date.forward(days: 21),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    }, {
        name: "Python",
        grade: 0,
        due_date: Faker::Date.forward(days: 14),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    }, {
        name: "C++",
        grade: 0,
        due_date: Faker::Date.forward(days: 10),
        date_submitted: nil,
        resubmit: false,
        comment: nil
    }
    ])
end


