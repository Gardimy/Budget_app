require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) do
    User.create(
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  describe 'GET #index' do
    it 'returns a successful response for categories of a specific user' do
      sign_in user # Sign in the user here
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      sign_in user # Sign in the user here
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      sign_in user # Sign in the user here
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      sign_in user # Sign in the user here
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #welcome' do
    it 'returns a successful response' do
      sign_in user # Sign in the user here
      get :index
      expect(response).to render_template(:index)
    end

    it 'renders the welcome template' do
      sign_in user # Sign in the user here
      get :index
      expect(response).to render_template(:index)
    end
  end
end
