class Prescription < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :consult_type

  after_create :send_mail

  scope :ultimos, -> { order("created_at DESC")}
  # Ex:- scope :active, -> {where(:active => true)}

  def send_mail
    AnswerMailer.new_prescription(self).deliver!
  end

end
