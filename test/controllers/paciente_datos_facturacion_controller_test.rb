require 'test_helper'

class PacienteDatosFacturacionControllerTest < ActionDispatch::IntegrationTest
  test "should get DatosFacturacion" do
    get paciente_datos_facturacion_DatosFacturacion_url
    assert_response :success
  end

end
