FactoryBot.define do
  factory :contact_log do
    user
    elements { "MyText" }
    error { "MyString" }
  end
end
