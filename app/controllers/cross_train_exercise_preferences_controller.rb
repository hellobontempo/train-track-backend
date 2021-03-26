class CrossTrainExercisePreferencesController < ApplicationController
  before_action :set_cross_train_exercise_preference, only: [:show, :update, :destroy]

  # GET /cross_train_exercise_preferences
  def index
    @cross_train_exercise_preferences = CrossTrainExercisePreference.all

    render json: @cross_train_exercise_preferences
  end

  # GET /cross_train_exercise_preferences/1
  def show
    render json: @cross_train_exercise_preference
  end

  # POST /cross_train_exercise_preferences
  def create
    @cross_train_exercise_preference = CrossTrainExercisePreference.new(cross_train_exercise_preference_params)

    if @cross_train_exercise_preference.save
      render json: @cross_train_exercise_preference, status: :created, location: @cross_train_exercise_preference
    else
      render json: @cross_train_exercise_preference.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cross_train_exercise_preferences/1
  def update
    if @cross_train_exercise_preference.update(cross_train_exercise_preference_params)
      render json: @cross_train_exercise_preference
    else
      render json: @cross_train_exercise_preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cross_train_exercise_preferences/1
  def destroy
    @cross_train_exercise_preference.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cross_train_exercise_preference
      @cross_train_exercise_preference = CrossTrainExercisePreference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cross_train_exercise_preference_params
      params.require(:cross_train_exercise_preference).permit(:cross_train_program_id, :cross_train_exercise_id)
    end
end
