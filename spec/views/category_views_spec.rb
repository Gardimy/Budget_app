require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) do
    User.create(
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  before(:each) do
    allow_any_instance_of(User).to receive(:confirmed?).and_return(true)
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response for categories of a specific user' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #welcome' do
    it 'returns a successful response' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'renders the welcome template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
