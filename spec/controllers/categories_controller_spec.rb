require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET index" do
    it "requires authentication" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  # Add more tests for other controller actions as needed
end
