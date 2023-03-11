class Address < ApplicationRecord
  has_one_attached :image
  belongs_to :customer

  def address_display
    '〒' + postal_code + address + name
  end
end
