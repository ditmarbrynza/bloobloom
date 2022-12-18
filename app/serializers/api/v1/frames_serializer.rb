# frozen_string_literal: true

module Api
  module V1
    class FramesSerializer < ActiveModel::Serializer
      attributes %i[id name description status stock price currency_id created_at updated_at]
    end
  end
end 
