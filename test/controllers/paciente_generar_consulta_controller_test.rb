require 'test_helper'

class PacienteGenerarConsultaControllerTest < ActionDispatch::IntegrationTest
  test "should get GenerarConsulta" do
    get paciente_generar_consulta_GenerarConsulta_url
    assert_response :success
  end

end
