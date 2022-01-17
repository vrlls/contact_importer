FactoryBot.define do
  factory :contact do
    user
    name { Faker::Name.unique.name }
    date_of_birth { Faker::Date.in_date_period(year: 2000) }
    phone { "(+57) 304 602 88 93" }
    address { "MyString" }
    credit_card { "30569309025904" }
    franchise { "" }
    email { "MyString@gamil.com" }
  end
end
