require 'test_helper'

class MedicosMenuControllerTest < ActionDispatch::IntegrationTest
  test "should get MedicosMenu" do
    get medicos_menu_MedicosMenu_url
    assert_response :success
  end

end
