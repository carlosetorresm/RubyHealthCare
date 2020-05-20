require 'test_helper'

class MedicosPreescribirRecetaControllerTest < ActionDispatch::IntegrationTest
  test "should get MedicosPreescribirReceta" do
    get medicos_preescribir_receta_MedicosPreescribirReceta_url
    assert_response :success
  end

end
