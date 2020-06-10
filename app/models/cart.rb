class Cart < ApplicationRecord
  belongs_to :patient

  has_many :cart_detail
end
