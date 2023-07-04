# class UsersController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: :render_response_error


#     def show
#         render json: @current_user
#     end
#     def create
#         user = User.create!(user_params)
#        # session [:user_id] = user.id
#         render json: user, status: :created
#     end
    

#     private


#     def user_params
#         params.permit(:username, :img_url ,:bio , :password)
#     end

#     def render_response_error
#         render json: {error: "username or password is invalid"}, status: :unprocessable_entity
#     end
# end
class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_error
  
    def show
      render json: current_user
    end
  
    def create
      user = User.create!(user_params)
      render json: user, status: :created
    end
  
    private
  
    def user_params
      params.permit(:username, :image_url, :bio, :password)
    end
  
    def render_response_error
      render json: { error: "Username or password is invalid" }, status: :unprocessable_entity
    end
  end
  