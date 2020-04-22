class ApplicationController < ActionController::Base
  def require_admin!
    raise Exception unless current_user&.admin  # this should be some auth exception
  end
end
