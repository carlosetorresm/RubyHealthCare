class Payment < ApplicationRecord
    belongs_to :patient
    has_many :sell
end
