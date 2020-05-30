require 'test_helper'

class MedicosCanalizarPacientesControllerTest < ActionDispatch::IntegrationTest
  test "should get CanalizarPacientes" do
    get medicos_canalizar_pacientes_CanalizarPacientes_url
    assert_response :success
  end

end
