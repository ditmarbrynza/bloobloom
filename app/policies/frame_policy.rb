# frozen_string_literal: true

class FramePolicy < ApplicationPolicy
  def create?
    user.admin?
  end
end
