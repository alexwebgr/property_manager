FactoryBot.define do
  factory :property do
    title { "MyString" }
    area { "MyString" }
    placeId { "MyString" }
    price { 1 }
    extra_description { "MyText" }
    user
    transaction_type
  end
end
