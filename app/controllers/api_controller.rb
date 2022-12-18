# frozen_string_literal: true

class ApiController < ApplicationController
  include Api::AuthHandler
  include Pundit::Authorization

  prepend_before_action :authenticate_user!, except: :handler_404
  
  def handler_404
    render(json: { message: 'Not found', errors: 'Not found' }, status: :not_found)
  end

  def pundit_user
    @current_user
  end
end
