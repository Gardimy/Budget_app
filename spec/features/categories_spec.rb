require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) do
    User.create(
      email: 'john@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  describe 'Category New Page' do
    before(:each) do
      sign_in user # Sign in the user here
    end

    it 'allows the user to create a new category' do
      visit new_category_path

      fill_in 'Name', with: 'Books'
      select 'Education', from: 'category_icon'
      click_button 'Save'

      expect(page).to have_content("Category 'Books' was successfully created.")
    end
  end

  describe 'Category New Page' do
    before(:each) do
      sign_in user # Sign in the user here
    end

    it 'allows the user to create a new category' do
      visit new_category_path

      fill_in 'Name', with: 'Books'
      select 'Education', from: 'category_icon'
      click_button 'Save'

      expect(page).to have_content("Category 'Books' was successfully created.")
    end
  end
end
