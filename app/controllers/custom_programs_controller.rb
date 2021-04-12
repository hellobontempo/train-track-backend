class CustomProgramsController < ApplicationController
  before_action :set_custom_program, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]

  # GET /custom_programs
  def index
    @custom_programs = CustomProgram.all

    render json: @custom_programs
  end

  # GET /custom_programs/1
  def show
    render json: @custom_program
  end

  # POST /custom_programs
  def create
    @custom_program = CustomProgram.new(custom_program_params)

    if @custom_program.save
      render json: @custom_program, status: :created, location: @custom_program
    else
      render json: @custom_program.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /custom_programs/1
  def update
    if @custom_program.update(custom_program_params)
      render json: @custom_program
    else
      render json: @custom_program.errors, status: :unprocessable_entity
    end
  end

  # DELETE /custom_programs/1
  def destroy
    @custom_program.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_program
      @custom_program = CustomProgram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def custom_program_params
      params.require(:custom_program).permit(:exercise_id, :user_program_id, :day, :workout_date, :miles, :week)
    end
end
