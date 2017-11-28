server "location.api", user: "deployer", roles: %w{app db web}

set :stage, :production
set :rails_env, 'production'