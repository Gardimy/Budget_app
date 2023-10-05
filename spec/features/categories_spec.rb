# spec/features/categories_spec.rb

require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
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

  describe 'Category New Page' do
    it 'allows the user to create a new category' do
      visit new_category_path

      fill_in 'Name', with: 'Books'
      select 'Education', from: 'category_icon'
      click_button 'Save'

      expect(page).to have_content("Category 'Books' was successfully created.")
    end
  end
end
