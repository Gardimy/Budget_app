require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with a name and icon" do
    user = FactoryBot.create(:user)
    category = Category.new(name: "Groceries", icon: "grocery-icon", user: user)
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    user = FactoryBot.create(:user)
    category = Category.new(icon: "grocery-icon", user: user)
    expect(category).to_not be_valid
  end

  it "is not valid without an icon" do
    user = FactoryBot.create(:user)
    category = Category.new(name: "Groceries", user: user)
    expect(category).to_not be_valid
  end
end
