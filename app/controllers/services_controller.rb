class ServicesController < ApplicationController

    #GET /services
    def index
        if current_doctor
            @service = Service.all
        else
            redirect_to root_path
        end
    end

    #GET /services/new
    def new
        if current_doctor
            @service = Service.new
        else
            redirect_to root_path
        end
    end

    #POST /services
    def create
        #Insert into services
        @service = Service.new(service_params)
        if @service.save
            redirect_to services_path
        else
            render :new
        end
    end

    def destroy
        #Deletefrom services
        @service = Service.find( params[:id])
        @service.destroy
        redirect_to services_path
    end

    def service_params
        params.require(:service).permit(:name,:description)
    end
end