class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound,with: :render_record_invalid_response
before_action :authorize
 private



def authorize
  @current_user = User.find_by(id: session[:user_id])
  render json: {errors: ["not authorized"]}
end




 def render_record_invalid_response(invalid)
  render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
 end

end
