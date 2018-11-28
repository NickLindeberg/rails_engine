FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    customer { nil }
    transaction { nil }
  end
end
