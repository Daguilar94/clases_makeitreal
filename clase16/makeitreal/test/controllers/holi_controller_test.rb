require 'test_helper'

class HoliControllerTest < ActionDispatch::IntegrationTest
  test "should get crear" do
    get holi_crear_url
    assert_response :success
  end

  test "should get actualizar" do
    get holi_actualizar_url
    assert_response :success
  end

  test "should get ver" do
    get holi_ver_url
    assert_response :success
  end

end
