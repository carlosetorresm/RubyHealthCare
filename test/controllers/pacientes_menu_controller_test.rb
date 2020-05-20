require 'test_helper'

class PacientesMenuControllerTest < ActionDispatch::IntegrationTest
  test "should get PacientesMenu" do
    get pacientes_menu_PacientesMenu_url
    assert_response :success
  end

end
