require 'test_helper'

class RegistroPacientesControllerTest < ActionDispatch::IntegrationTest
  test "should get RegistroPacientes" do
    get registro_pacientes_RegistroPacientes_url
    assert_response :success
  end

end
