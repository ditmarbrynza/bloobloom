module Api
  module V1
    class LensesSerializer < ActiveModel::Serializer
      attributes %i[id color description prescription_type lens_type stock price currency_id
        created_at updated_at]
    end
  end
end  
