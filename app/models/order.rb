class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
   validates :payment_method, presence: true
   validates :name, presence: true
   validates :address, presence: true
   validates :postal_code, presence: true

  belongs_to :customer, dependent: :destroy
  has_many :order_details

  def with_tax_price
      (price * 1.1).floor
  end

  

end
