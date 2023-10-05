require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "GET index" do
    it "requires authentication" do
      get :index, params: { category_id: create(:category) }
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  # Add more tests for other controller actions as needed
end
