Rails.application.routes.draw do
  devise_for :admins
  default_url_options host: "no-reply@gmail.com", port: 3000
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :banknotes

  devise_scope :admin do
    authenticated :admin do
      root to: "admin/dashboard#show", as: :admin
    end
  end

  root to: "users#show"
end
