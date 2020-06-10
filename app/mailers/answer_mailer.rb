class AnswerMailer < ApplicationMailer
    def new_answer(answer)
        @answer = answer
        
        mail to: @answer.consult.patient.email, 
             subject: "Se ha respondido a su consulta"
    end     
    def new_prescription(prescription)
        @prescription = prescription

        attachments["Receta_#{@prescription.id}.pdf"] = WickedPdf.new.pdf_from_string(
        render_to_string(:template => 'prescriptions/receta', :pdf =>'Receta', :layout => 'pdf.html'), 
        )
        
        mail to: @prescription.patient.email, 
             subject: "Su receta ha sido generada"
    end    
    
    def new_bill(bill)
        @bill = bill

        attachments["Receta_#{@bill.id}.pdf"] = WickedPdf.new.pdf_from_string(
        render_to_string(:template => 'bills/factura', :pdf =>'factura', :layout => 'pdf.html'), 
        )
        
        mail to: @bill.patient.email, 
             subject: "Su receta ha sido generada"
    end     
end
