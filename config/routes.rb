Rails.application.routes.draw do
  
  devise_for :users, :controllers => {:registrations => "authentication/registrations"}
  devise_scope :user do
    get "/users" => "authentication/registrations#index", as: "show_users_registration"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'
  resources  :zones, :activities
end
