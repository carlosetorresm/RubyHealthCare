class Sell < ApplicationRecord
  belongs_to :patient
  belongs_to :shipping
  belongs_to :payment

  has_many :sell_detail
end
