Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put]
    end
  end
  #https://mytasks-ruby.herokuapp.com
  #http://127.0.0.1:4200
  Rails.application.config.hosts << "https://mytasks-ruby.herokuapp.com"