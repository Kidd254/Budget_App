class Users::Sessions::ConfirmationsController < Devise::ConfirmationsController
  def resend
    user = User.find_by(email: params[:email])

    if user
      if user.confirmed?
        # The user is already confirmed, no need to resend instructions.
        flash[:notice] = 'Your account is already confirmed.'
      else
        # Resend confirmation instructions.
        user.send_confirmation_instructions
        flash[:notice] = 'Confirmation instructions have been resent to your email.'
      end
    else
      flash[:alert] = 'No user with that email address found.'
    end
    redirect_to root_path
  end
end
