FactoryBot.define do
  factory :invoice do
    status { "MyString" }
    customer { create(:customer) }
    merchant { create(:merchant) }
  end
end
