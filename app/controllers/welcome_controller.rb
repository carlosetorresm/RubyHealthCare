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
  def search
    if doct = Doctor.where(speciality_id: search_params[:speciality_id])
      @search = DService.where(doctor: doct, service_id: search_params[:service_id])
    else
      @search = nil
    end
  end
  def show
  end
  def recipe
    @sell = Sell.paginate(page: params[:page], per_page:5).where(patient: current_patient)
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'welcome/recibo', pdf:'recibo', layout: 'pdf.html'}
    end
  end
  def search_params
    params.require(:algo).permit(:speciality_id,:service_id)
  end
end
