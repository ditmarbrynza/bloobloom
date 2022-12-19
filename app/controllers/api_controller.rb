# frozen_string_literal: true

class ApiController < ApplicationController
  include Api::AuthHandler
  prepend_before_action :authenticate_user!, except: :handler_404
  rescue_from Errors::ApiError, with: :authentication_error

  def handler_404
    render(json: { message: 'Not found', errors: 'Not found' }, status: :not_found)
  end

  protected

  def authentication_error(exception)
    Rails.logger.error("#{self.class} Authentication error! Message: #{exception.message}")
    render(json: { error: exception.message }, status: :forbidden)
  end
end
