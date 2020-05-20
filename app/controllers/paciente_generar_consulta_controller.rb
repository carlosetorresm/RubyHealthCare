class PacienteGenerarConsultaController < ApplicationController
  def GenerarConsulta
    @sintomas = params[:sintomas]
  end
end
