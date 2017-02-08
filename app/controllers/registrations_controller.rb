class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(registration_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        respond_with resource, :location => after_sign_up_path_for(resource)
      end
    else
      clean_up_passwords
      respond_with resource
    end
  end


  private

  def registration_params
    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up)
    end
    
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end
