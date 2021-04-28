class AssignmentMastersController < ApplicationController
  before_action :set_assignment_master, only: [:show, :update, :destroy]

  # GET /assignment_masters
  def index
    @assignment_masters = AssignmentMaster.all

    render json: @assignment_masters
  end

  # GET /assignment_masters/1
  def show
    render json: @assignment_master
  end

  # POST /assignment_masters
  def create

    AssignmentMaster.create(assignment_master_params)

   assign()
  


    # @assignment_master = AssignmentMaster.new(assignment_master_params)

    # if @assignment_master.save
    #   render json: @assignment_master, status: :created, location: @assignment_master
    # else
    #   render json: @assignment_master.errors, status: :unprocessable_entity
    # end
  end
def assign
  new_assignment = AssignmentMaster.find_or_create_by(name: assignment_master_params[:name])

  students = Student.all
  name = new_assignment.name
  id = new_assignment.id
    students.each do |student| 
        student.assignments.create({
        name: name,
        grade: Faker::Number.between(from: 52, to: 102),
        due_date: Faker::Date.forward(days: 14),
        date_submitted: nil,
        resubmit: false,
        comment: nil,
        assignment_master_id: id
    })
   end
  p new_assignment.id
  
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
      params.require(:assignment_master).permit(:name, :description)
    end
end
