require 'api'

Ohayo::Application.routes.draw do
  mount Ohayo::API => '/'
  devise_for :users, path: ''
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
    get "/settings" => "devise/registrations#edit"
  end
  resources :users, except: :index
  root to: "users#index", constraints: lambda { |r| r.env["warden"].authenticate? }
  root to: 'high_voltage/pages#show', :id => 'home'
  match "/404", :to => "high_voltage/pages#show", :id => "404"
  match "/422", :to => "high_voltage/pages#show", :id => "422"
  match "/500", :to => "high_voltage/pages#show", :id => "500"
end
