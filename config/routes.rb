Rails.application.routes.draw do
  devise_for :users

  # Custom sign out
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy",
        as: :custom_destroy_user_session
  end

  # Authenticated users
  authenticated :user do
    root "categories#index", as: :authenticated_root
  end

  # Non-authenticated users
  root "welcome#index"

  # Categories and transactions
  resources :categories do
    resources :transactions
  end

  # Rails health check for Render
  get "/up" => "rails/health#show", as: :rails_health_check
end
