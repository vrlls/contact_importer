FactoryBot.define do
  factory :contact do
    name { "MyString" }
    date_of_birth { "2021-11-19" }
    phone { "MyString" }
    address { "MyString" }
    credit_card { nil }
    franchise { "MyString" }
    email { "MyString" }
  end
end
