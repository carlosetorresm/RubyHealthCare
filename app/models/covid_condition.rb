class CovidCondition < ApplicationRecord
  belongs_to :patient
  belongs_to :condition

  scope :primeros, -> { order("created_at ASC")}
  # Ex:- scope :active, -> {where(:active => true)}
end
