# frozen_string_literal: true

module Validations
  class Base
    include Dry::Monads[:result]
    include ActiveModel::Model
    include ActiveModel::Attributes

    def to_h
      attributes.deep_symbolize_keys
    end

    def validation_response
      if valid?
        Success(self)
      else
        Failure(errors.messages)
      end
    end

    def self.call(params = {})
      @keys ||= attribute_types.symbolize_keys.keys
      params = params.symbolize_keys.dup.extract!(*@keys)
      new(params).validation_response
    end
  end
end
