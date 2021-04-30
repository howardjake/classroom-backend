class AssignmentMastersController < ApplicationController
  before_action :set_assignment_master, only: [:show, :update, :destroy]

  # GET /assignment_masters
  def index
    @assignment_masters = AssignmentMaster.all
    
    @assignment_masters.each do |master|
      average = assignment_average(master.id)
      master.average = average
    end

    render json: @assignment_masters
  end

  # GET /assignment_masters/1
  def show
    average = assignment_average(params[:id])
    show = @assignment_master
    show["average"] = average
    render json: show, :methods => :average 
  end

  # grabs the average grad of the assignment from all students
  def assignment_average id
    assignments = Assignment.where(assignment_master_id: id)
    grades = []

    if grades = []
      average = 0
    elsif grades
      assignments.each do |assignment|
        grades << assignment.grade
      end
      
      average = grades.reduce {|sum, n| sum + n}/grades.length
    end

  end

  # POST /assignment_masters
  def create
    course = Course.find(1)

    @assignment_master = course.assignment_masters.create(assignment_master_params)

    # @assignment_master = AssignmentMaster.new(assignment_master_params)

    assign()
  
    if @assignment_master.save
      render json: @assignment_master, status: :created, location: @assignment_master
    else
      render json: @assignment_master.errors, status: :unprocessable_entity
    end
  end

# Creates all assignments in assignment model
  def assign
    new_assignment = AssignmentMaster.  find_or_create_by(name:   assignment_master_params[:name])

    students = Student.all
    name = new_assignment.name
    id = new_assignment.id
    due_date = new_assignment.due_date
      students.each do |student| 
          student.assignments.create({
          name: name,
          grade: Faker::Number.between(from: 52,  to: 102),
          due_date: due_date,
          date_submitted: nil,
          resubmit: false,
          comment: nil,
          assignment_master_id: id
      })
     end
  end

  # PATCH/PUT /assignment_masters/1
  def update
    if @assignment_master.update(assignment_master_params)
      render json: @assignment_master
    else
      render json: @assignment_master.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assignment_masters/1
  def destroy
    @assignment_master.destroy

    assignments = Assignment.all

    assignments.where(assignment_master_id: params[:id]).destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_master
      @assignment_master = AssignmentMaster.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_master_params
      params.require(:assignment_master).permit(:name, :description, :due_date)
    end
end
