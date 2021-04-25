  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
		  if resource_name == :customer
			  customers_my_page_path
		  elsif resource_name == :admin
		    admin_root_path
		  end
    end

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone_number, :postal_code, :address])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
      end
  end
