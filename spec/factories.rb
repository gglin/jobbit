FactoryGirl.define do
  factory :user do |f|
    # f.sequence(:email) { |n| "foo#{n}@example.com" }
    # f.password "secret"

    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
  end

  factory :company do
    sequence(:name) { |n| "Acme#{n}" }
  end

  factory :invalidcompany do
    sequence(:name) { |n| "Acme#{n}" }
  end
end