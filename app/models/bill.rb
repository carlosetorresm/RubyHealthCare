class Bill < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  
  after_create :send_mail

  scope :ultimos, -> { order("created_at DESC")}
  # Ex:- scope :active, -> {where(:active => true)}

  def send_mail
    AnswerMailer.new_bill(self).deliver!
  end

end
