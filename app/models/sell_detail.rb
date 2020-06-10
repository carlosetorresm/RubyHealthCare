class SellDetail < ApplicationRecord
  belongs_to :sell
  belongs_to :medicament
end
