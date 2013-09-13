FactoryGirl.define do

  factory :user do

    user_name "familia_gomez"
    password "123456"
    password_confirmation "123456"

    trait :other_user do
      user_name "familia_perez"
    end

  end

end