require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) do
    User.create(
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  let(:category) do
    Category.create(
      name: 'Education',
      icon: 'imgexample.png',
      user:
    )
  end

  describe 'GET #index' do
    it 'returns a successful response for transactions within a specific category' do
      sign_in user
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template for transactions within a specific category' do
      sign_in user
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response for creating a new transaction within a category' do
      sign_in user
      get :new, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template for creating a new transaction within a category' do
      sign_in user
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:transaction_attributes) do
      {
        name: 'Burger',
        amount: 1.5
      }
    end

    it 'creates a new transaction' do
      sign_in user
      expect do
        post :create, params: { category_id: category.id, transaction: transaction_attributes }
      end.to change(Transaction, :count).by(1)
    end

    it 'redirects to the index page after creating a new transaction' do
      sign_in user
      post :create, params: { category_id: category.id, transaction: transaction_attributes }
      expect(response).to redirect_to(category_transactions_path(category))
    end

    it 're-renders the new template if transaction creation fails' do
      sign_in user
      # Invalid transaction attributes to simulate a failure
      invalid_attributes = transaction_attributes.merge(amount: nil)
      post :create, params: { category_id: category.id, transaction: invalid_attributes }
      expect(response).to render_template(:new)
    end
  end
end
