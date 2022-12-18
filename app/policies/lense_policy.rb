# frozen_string_literal: true

class LensePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
