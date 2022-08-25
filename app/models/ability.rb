# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?
    can [:edit, :create, :destroy], Producto, user: user
  end
end
