Rails.application.config.middleware.insert_before 0, Rack::Cors do

  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true # Allows cookies to be sent with requests
  end 

  allow do
    origins "https://juwu.herokuapp.com"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true # Allows cookies to be sent with requests
  end 

end 