FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.free_email }
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    gimei = Gimei.name
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    last_name_kata { gimei.last.katakana }
    first_name_kata { gimei.first.katakana }
    birth { Faker::Date.between(from: '2014-01-23', to: '2014-09-25') }
  end
end
