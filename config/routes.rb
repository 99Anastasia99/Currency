Rails.application.routes.draw do
  devise_for :admins, controllers: { invitations: "admin/invitations" }
  devise_for :cashiers, controllers: { invitations: "cashier/invitations" }
  default_url_options host: "no-reply@gmail.com", port: 3000
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :banknotes
  resources :operations
  resources :cashiers do
    resource :reset_password, only: :create, module: "cashier"
  end

  resources :admins do
    resource :reset_password, only: :create, module: "admins"
  end

  devise_scope :admin do
    authenticated :admin do
      root to: "admin/dashboard#show", as: :admin_dashboard
    end
  end

  devise_scope :cashier do
    get "sign_in", to: "devise/sessions#new"
    authenticated :cashier do
      root to: "admin/dashboard#show", as: :cashier_dashboard
    end
  end

  # concern :toggleable do
  #   put :activate, on: :member
  #   put :deactivate, on: :member
  # end

  root to: "admin/dashboard#show"
end
