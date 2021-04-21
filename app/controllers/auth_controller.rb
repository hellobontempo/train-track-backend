class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :auto_login]

  def create 
    user = User.find_by(email: [params[:email]])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json: {user: user, jwt: token}
    else 
      render json: {message: "Log in failed!"}
    end
  end

  def auto_login
    if current_user
      render json: current_user
    else
      render json: {error: "No User Logged In"}
    end

  end

end
#   # GET /auth
#   def index
#     @auth = Auth.all

#     render json: @auth
#   end

#   # GET /auth/1
#   def show
#     render json: @auth
#   end

#   # POST /auth
#   def create
#     @auth = Auth.new(auth_params)

#     if @auth.save
#       render json: @auth, status: :created, location: @auth
#     else
#       render json: @auth.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /auth/1
#   def update
#     if @auth.update(auth_params)
#       render json: @auth
#     else
#       render json: @auth.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /auth/1
#   def destroy
#     @auth.destroy
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_auth
#       @auth = Auth.find(params[:id])
#     end

#     # Only allow a list of trusted parameters through.
#     def auth_params
#       params.fetch(:auth, {})
#     end
# end
