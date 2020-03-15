FactoryGirl.define do
  factory :user do
    factory :valid_user do
      email { FFaker::Internet.email }
      password "12345678"
      password_confirmation "12345678"
    end

    factory :invalid_user do
      email { FFaker::Internet.email }
      password_confirmation "abcd1234"
      password "wkwkwkwk"
    end
  end
end