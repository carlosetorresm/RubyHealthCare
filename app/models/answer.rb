class Answer < ApplicationRecord
  belongs_to :consult
  belongs_to :doctor

  after_create :send_mail

  def send_mail
    AnswerMailer.new_answer(self).deliver!
  end
end
