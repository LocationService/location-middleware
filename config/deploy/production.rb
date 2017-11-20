server "145.239.90.55", user: "deployer", roles: %w{app db web}

set :stage, :production
set :rails_env, 'production'