Rails.application.routes.draw do
  mount Occson::Rails::Engine => "/occson-rails"
end
