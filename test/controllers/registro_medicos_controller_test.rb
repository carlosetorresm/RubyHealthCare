require 'test_helper'

class RegistroMedicosControllerTest < ActionDispatch::IntegrationTest
  test "should get RegistroMedicos" do
    get registro_medicos_RegistroMedicos_url
    assert_response :success
  end

end
