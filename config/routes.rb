Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users

  root to: 'static_pages#home', :via => [:get]

  match '/help', to: 'static_pages#help', :via => [:get]
  match '/about', to: 'static_pages#about', :via => [:get]
  match '/contact', to: 'static_pages#contact', :via => [:get]

   devise_scope :user do
    get "/auth/:provider/callback" => "devise/sessions#new"
  end
end
