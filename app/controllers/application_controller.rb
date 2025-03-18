class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.comedian?
      user_path(resource)
    elsif resource.venue?
      user_path(resource)
    else
      root_path
    end
  end
end
