# frozen_string_literal: true

module Errors
  class ApiError < StandardError
    attr_reader :message, :errors, :status

    def initialize(message, errors = nil, status = 400)
      @message = message
      @errors  = errors
      @status  = status
    end
  end
end
