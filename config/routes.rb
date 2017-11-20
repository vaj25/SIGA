Rails.application.routes.draw do
  
  get 'detail_incomes/index'

  get 'trees/index'

  get 'resource_activities/index'

  get 'resource_activities_trees/index'

  devise_for :users, :controllers => {:registrations => "authentication/registrations"}
  devise_scope :user do
    get "/users" => "authentication/registrations#index", as: "show_users_registration"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  resources  :zones, :activities, :trees, :collections, :detail_incomes, :administration, :resource_activities, :resource_activities_trees

end