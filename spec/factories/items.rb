FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyText" }
    unit_price { 1 }
    merchants { nil }
  end
end