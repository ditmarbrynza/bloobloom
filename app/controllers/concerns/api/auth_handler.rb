# frozen_string_literal: true

module Api
  module AuthHandler
    extend ActiveSupport::Concern

    NO_AUTH_TOKEN_ERROR = ::Errors::ApiError.new("You have to specify your API token.", nil, 403)
    INVALID_AUTH_TOKEN_ERROR = ::Errors::ApiError.new("You have to specify valid API token.", nil, 
      403)

    def authenticate_user!
      if (token = request.headers['Authorization']).blank?
        raise NO_AUTH_TOKEN_ERROR
      end
      
      @current_user = User.find_by(api_token: token)
      
      unless @current_user
        raise INVALID_AUTH_TOKEN_ERROR
      end
    end
  end
end
