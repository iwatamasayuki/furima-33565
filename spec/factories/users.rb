FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { Gimei.last.kanji }
    last_name             { Gimei.first.kanji }
    first_name_kana       { Gimei.last.katakana }
    last_name_kana        { Gimei.first.katakana }
    birthday              { '1930-01-01' }
  end
end
