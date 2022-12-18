class ApplicationController < ActionController::API
  wrap_parameters format: [:json]
  
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |_exception|
    render json: ["You don't have permission for this action"], status: :forbidden
  end

  def pundit_user
    @current_user
  end
end
