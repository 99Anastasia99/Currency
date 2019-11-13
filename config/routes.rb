Rails.application.routes.draw do
  devise_for :admins
  devise_for :cashiers
  default_url_options host: "no-reply@gmail.com", port: 3000
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :banknotes
  resources :converters

  devise_scope :admin do
    authenticated :admin do
      root to: "admin/dashboard#show", as: :admin
    end
  end

  devise_scope :cashier do
    get "sign_in", to: "devise/sessions#new"
    authenticated :cashier do
      root to: "admin/dashboard#show", as: :cashier
    end
  end

  root to: "admin/dashboard#show"
end
