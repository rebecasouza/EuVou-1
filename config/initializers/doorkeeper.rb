Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  # This block will be called to check whether the resource owner is authenticated or not.
  resource_owner_from_credentials do
    # Put your resource owner authentication logic here.
    # Example implementation:
    User.find_by(email: params[:email]).try(:authenticate, params[:password])
  end

  
  access_token_methods :from_bearer_authorization, :from_access_token_param, :from_bearer_param

  grant_flows %w(authorization_code client_credentials)

end

Doorkeeper.configuration.token_grant_types << "password"
