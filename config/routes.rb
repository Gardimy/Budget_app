Rails.application.routes.draw do
	devise_for :users
  # Redirect authenticated users to the categories#index page
  devise_scope :user do
    get "/custom_sign_out" => "devise/sessions#destroy", as: :custom_destroy_user_session
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  # For non-authenticated users, show the welcome#index page
  root 'welcome#index'

  resources :categories do
    resources :transactions
  end
end
