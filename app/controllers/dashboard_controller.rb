class DashboardController < ApplicationController
    def index
        course = Course.find(1)
        name = course.period
        assignments_list = course.assignments
        start_date = course.start_date
        end_date = course.end_date
        number_of_students = Student.count
        schedule = course.schedule
        

        students = Student.all
        assignments = Assignment.all
        all_grades = []

        students.each do |student|
            grades = []

            current = assignments.where(student_id: student.id)       
            
            current.each do |assignment|
                grades << assignment.grade
            end

            average = grades.reduce {|sum, n| sum + n }/grades.length

            all_grades << average
        end
        
        class_average = all_grades.reduce {|sum, n| sum + n }/all_grades.length

        def median array
            return nil if array.empty?
            sorted = array.sort
            len = sorted.length
            (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
        end

        class_median = median(all_grades)

        render json:{ 
            class_average: class_average,
            class_median: class_median, 
            name: name, 
            assignments: assignments_list, 
            start_date: start_date,
            end_date: end_date,
            number_of_students: number_of_students,
            schedule: schedule
        }
    end
end