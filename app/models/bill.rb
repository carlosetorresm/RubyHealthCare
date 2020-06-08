class Bill < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  
  scope :ultimos, -> { order("created_at DESC")}
  # Ex:- scope :active, -> {where(:active => true)}
end
