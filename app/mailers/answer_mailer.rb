class AnswerMailer < ApplicationMailer
    def new_answer(answer)
        @answer = answer
        
        mail to: @answer.consult.patient.email, 
             subject: "Se ha respondido a su consulta"
    end        
end
