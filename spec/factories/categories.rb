FactoryBot.define do
  factory :category do
    # Define category attributes here, e.g., name, icon, etc.
    name { 'Money' }
    icon { 'icon.png' }
    association :user, factory: :user # Assuming a user is associated with a category
  end
end
