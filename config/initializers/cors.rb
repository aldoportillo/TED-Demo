Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '127.0.0.1:5501'  # TODO: Change this to the domain you will make the request fromtails
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: false 
    end
  end
  