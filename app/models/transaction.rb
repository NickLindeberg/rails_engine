class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number,
                        :result
  belongs_to :invoice

  scope :successful, -> { where(result: "success") }

  default_scope { order(:id)}

  def self.transaction_by_cust(id)
    Transaction.joins(:invoices)
               .where("invoices.customer_id = #{id}")
  end
end
