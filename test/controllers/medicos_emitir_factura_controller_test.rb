require 'test_helper'

class MedicosEmitirFacturaControllerTest < ActionDispatch::IntegrationTest
  test "should get EmitirFactura" do
    get medicos_emitir_factura_EmitirFactura_url
    assert_response :success
  end

end
