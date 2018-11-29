class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :credit_card_expiration_date, :credit_card_number, :result
end
