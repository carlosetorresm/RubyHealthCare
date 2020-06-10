class CartDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :medicament

end
