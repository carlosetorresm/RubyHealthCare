class WelcomeController < ApplicationController
  def index
    if doctor_signed_in?
      @consults = Consult.paginate(page: params[:page], per_page:5).where(doctor: current_doctor).abierta
    else
      if patient_signed_in?
        @consults = Consult.paginate(page: params[:page], per_page:5).where(patient: current_patient).respondida.ultimos
      end 
    end
  end
  def closed
    if doctor_signed_in?
      @consults = Consult.paginate(page: params[:page], per_page:5).where(doctor: current_doctor).cerrada.ultimos
    end 
  end
end
