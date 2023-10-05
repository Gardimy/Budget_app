# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @categories' do
      get :index
      expect(assigns(:categories)).to include(category)
    end

    it 'assigns @total_amounts' do
      get :index
      expect(assigns(:total_amounts)).to be_a(Hash)
    end

    # Add more controller tests for 'index' action
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: category.id }
      expect(response).to render_template('show')
    end

    it 'assigns @category' do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'assigns @transactions' do
      get :show, params: { id: category.id }
      expect(assigns(:transactions)).to be_a(ActiveRecord::Relation)
    end

    it 'assigns @total_amount' do
      get :show, params: { id: category.id }
      expect(assigns(:total_amount)).to be_a(Numeric)
    end

    # Add more controller tests for 'show' action
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @category' do
      get :new
      expect(assigns(:category)).to be_a(Category)
    end

    # Add more controller tests for 'new' action
  end

  describe 'POST #create' do
    let(:valid_category_params) { attributes_for(:category) } # Assuming you have a Category factory

    it 'creates a new category with valid params' do
      expect do
        post :create, params: { category: valid_category_params }
      end.to change(Category, :count).by(1)

      expect(response).to redirect_to(categories_path)
      expect(flash[:notice]).to eq("Category '#{valid_category_params[:name]}' was successfully created.")
    end

    it 'does not create a new category with invalid params' do
      invalid_category_params = { name: '', icon: '' }

      expect do
        post :create, params: { category: invalid_category_params }
      end.to_not change(Category, :count)

      expect(response).to render_template('new')
    end

    # Add more controller tests for 'create' action
  end

  describe 'DELETE #destroy' do
    it 'destroys a category' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)

      expect(response).to redirect_to(categories_path)
      expect(flash[:notice]).to eq('Category was successfully deleted.')
    end

    it 'does not destroy a category when user is not authorized' do
      another_user = create(:user)
      another_category = create(:category, user: another_user)

      expect do
        delete :destroy, params: { id: another_category.id }
      end.to_not change(Category, :count)

      expect(response).to redirect_to(categories_path)
      expect(flash[:alert]).to eq('You are not authorized to delete this category.')
    end

    # Add more controller tests for 'destroy' action
  end
end
