FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    family_name           {"山田"}
    first_name_kana       {"タロウ"}
    family_name_kana      {"ヤマダ"}
    date_of_birth {Faker::Date.between(from: '1990-01-01', to:'2020-12-08')}
  end
end