class UserProgramsController < ApplicationController
  before_action :set_user_program, only: [:show, :update, :destroy]

  # GET /user_programs
  def index
    @user_programs = UserProgram.all

    render json: @user_programs, include: [:custom_programs]
  end

  # GET /user_programs/1
  def show
    render json: @user_program, include: [:custom_programs]
    # format.json  { render :json => @customer, :methods => :recent_calls}
  end

  # POST /user_programs
  def create
    byebug
    # @user_program = UserProgram.new(user_program_params)
    if @user_program.save!
      render json: @user_program, status: :created, location: @user_program
    else
      render json: @user_program.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_programs/1
  def update
    if @user_program.update(user_program_params)
      render json: @user_program
    else
      render json: @user_program.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_programs/1
  def destroy
    @user_program.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_program
      @user_program = UserProgram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_program_params
      params.require(:user_program).permit(:race_date, :username, :program_id, :first_rest_day, :second_rest_day)
    end
end
