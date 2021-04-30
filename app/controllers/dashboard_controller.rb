class DashboardController < ApplicationController
    def index
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

        render json:{class_average: class_average}
    end
end