class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        admin_root_path
      elsif resource_or_scope == :customer
        public_root_path
      else
        root_path
      end
  end
end
