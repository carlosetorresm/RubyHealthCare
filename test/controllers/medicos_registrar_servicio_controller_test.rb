require 'test_helper'

class MedicosRegistrarServicioControllerTest < ActionDispatch::IntegrationTest
  test "should get MedicosRegistrarServicio" do
    get medicos_registrar_servicio_MedicosRegistrarServicio_url
    assert_response :success
  end

end
