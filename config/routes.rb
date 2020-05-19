Rails.application.routes.draw do
  resources :users
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, except: [:new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
