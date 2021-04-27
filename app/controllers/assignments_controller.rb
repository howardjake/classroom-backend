class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :update, :destroy]

  # GET /assignments
  def index
    @assignments = Assignment.all

    render json: @assignments
  end

  # GET /assignments/1
  def show
    render json: @assignment
  end

  # POST /assignments
  def create
    # @assignment = Assignment.new(assignment_params)
    students = Student.all

    students.each do |student|
      student.assignments.create(assignment_params)
    end

    course_assignments = Assignment.all
    all_assign = []
    course_assignments.map do |assignment|
      all_assign.push(assignment[:name])
      all_assign.uniq!
    end
 
  course = Course.find(1)
  course.update(assignments: all_assign)

#     if @assignment.save
#       render json: @assignment, status: :created, location: @assignment
#     else
#       render json: @assignment.errors, status: :unprocessable_entity
#     end
  end

  # PATCH/PUT /assignments/1
  def update
    if @assignment.update(assignment_params)
      render json: @assignment
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignments/1
  def destroy
    course_assignments = Assignment.all


    # @assignment.destroy
  end
# DELETE /name
  def destroy_all

  end

  def destroy_all
      students = Student.each

      students.each do |student|
      student.assignments.where(name: assignment_params).destroy_all
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:name, :grade, :due_date, :date_submitted, :resubmit, :comment)
    end
end
