class DservicesController < ApplicationController
    
    #GET /dservices
    def index
        if current_doctor
            @dservice = DService.where(doctor: current_doctor)
        else
            @dservice = DService.all
        end
    end
    
    #GET /dservices/new
    def new
        if current_doctor
            @dservice = DService.new
        else
            redirect_to root_path
        end
    end

    #POST /dservices
    def create
        servicio=Service.find(params[:d_service][:service])
        @dservice = DService.new(service: servicio,
                                doctor: current_doctor,
                                price: params[:d_service][:price])
        if @dservice.save
            redirect_to dservices_path
        else
            render :new
        end
    end

    def destroy
        @dservice = DService.find(params[:id])
        @dservice.destroy
        redirect_to dservices_path
    end
end