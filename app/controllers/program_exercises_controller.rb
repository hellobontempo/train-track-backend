class ProgramExercisesController < ApplicationController
  before_action :set_program_exercise, only: [:show, :update, :destroy]

  # GET /program_exercises
  def index
    @program_exercises = ProgramExercise.all

    render json: @program_exercises
  end

  # GET /program_exercises/1
  def show
    render json: @program_exercise
  end

  # POST /program_exercises
  def create
    @program_exercise = ProgramExercise.new(program_exercise_params)

    if @program_exercise.save
      render json: @program_exercise, status: :created, location: @program_exercise
    else
      render json: @program_exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /program_exercises/1
  def update
    if @program_exercise.update(program_exercise_params)
      render json: @program_exercise
    else
      render json: @program_exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /program_exercises/1
  def destroy
    @program_exercise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_exercise
      @program_exercise = ProgramExercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_exercise_params
      params.require(:program_exercise).permit(:exercise_id, :amount, :program_id, :day)
    end
end
