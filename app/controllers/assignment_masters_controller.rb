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
    @assignment_master = AssignmentMaster.new(assignment_master_params)

    if @assignment_master.save
      render json: @assignment_master, status: :created, location: @assignment_master
    else
      render json: @assignment_master.errors, status: :unprocessable_entity
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
