  class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # end

    # def after_sign_in_path_for(resource)
    #   customers_my_page_path # ログイン後に遷移するpathを設定
    # end

    # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [
    #   :email,
    #   :name
    #   ])
    # end

    # ようこそ、山田さんへ
    # def application
    #   @customer = current_customer
    # end

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :phone_number, :postal_code, :address])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
      end
  end
