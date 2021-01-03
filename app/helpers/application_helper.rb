# frozen_string_literal: true

module ApplicationHelper
  def admin_signed_in?
    !!current_user&.admin
  end

  def eur(var)
    humanized_money_with_symbol var
  end
end
