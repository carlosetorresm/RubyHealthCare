class CitiesController < ApplicationController
  def index 
    @dcities = CS.get(params[:dcountry], params[:dstate])
    @pcities = CS.get(params[:pcountry], params[:pstate])
  end
end