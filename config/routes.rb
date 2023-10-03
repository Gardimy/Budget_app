Rails.application.routes.draw do
	devise_for :users
  # Redirect authenticated users to the categories#index page
  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  # For non-authenticated users, show the welcome#index page
  root 'welcome#index'

  resources :categories do
    resources :transactions
  end

  # Add other custom routes as needed
end
