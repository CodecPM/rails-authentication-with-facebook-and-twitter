class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def provider
    user = User.process_req_env(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Signed in Successfully!"
      sign_in_and_redirect user
      #redirect_to user_path user
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :twitter, :provider
  alias_method :facebook, :provider

  private
  def user_params
    params.require(:user).permit(:provider, :uid, :username)
  end
end
