Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :categories do
    resources :transactions
  end

  # Add other custom routes as needed
end
