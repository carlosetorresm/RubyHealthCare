class Medicament < ApplicationRecord
  belongs_to :type_medication
  
  has_many :sell_detail
  has_many :cart_detail
end
