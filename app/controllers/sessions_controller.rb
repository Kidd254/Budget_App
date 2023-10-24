class SessionsController < Devise::SessionsController
    # Your custom code or modifications here
  
    # Override the after_sign_in_path_for method to specify where to redirect after sign-in
    def after_sign_in_path_for(resource)
      # Customize the redirection path based on your requirements
      if resource.is_a?(User)
        # Redirect to the categories index page for users
        categories_path
      else
        # Redirect to a different path for other resource types
        root_path
      end
    end
  end
  