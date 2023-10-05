require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
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

  let(:category) do
    Category.create(
      name: 'Education',
      icon: 'imgexample.png',
      user: user
    )
  end

  describe 'GET #index' do
    it 'returns a successful response for transactions within a specific category' do
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template for transactions within a specific category' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response for creating a new transaction within a category' do
      get :new, params: { category_id: category.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template for creating a new transaction within a category' do
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
      expect {
        post :create, params: { category_id: category.id, transaction: transaction_attributes }
      }.to change(Transaction, :count).by(1)
    end

    it 'redirects to the index page after creating a new transaction' do
      post :create, params: { category_id: category.id, transaction: transaction_attributes }
      expect(response).to redirect_to(category_transactions_path(category))
    end

    it 're-renders the new template if transaction creation fails' do
      # Invalid transaction attributes to simulate a failure
      invalid_attributes = transaction_attributes.merge(amount: nil)
      post :create, params: { category_id: category.id, transaction: invalid_attributes }
    end
  end
end
