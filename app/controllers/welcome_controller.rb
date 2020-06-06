class WelcomeController < ApplicationController
  def index
    if current_doctor
      @consults = Consult.where(doctor: current_doctor.id, closed: 0)
    end 
  end
end
