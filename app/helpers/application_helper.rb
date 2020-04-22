module ApplicationHelper
  def admin_signed_in?
    !!(current_user&.admin)
  end
end
