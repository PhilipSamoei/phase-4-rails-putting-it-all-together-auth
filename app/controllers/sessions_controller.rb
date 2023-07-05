class SessionsController < ApplicationController
    before_action :authorize

    def create
        user = User.find_by(username: params[:username])
        if user &.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :ok, except: [:password_digest]
        else
            render json: {error: "Invalid username or password "}, status: :unauthorized
        end
    end
    def destroy
        if session[:user_id]
          session[:user_id] = nil
          head :no_content
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
end

