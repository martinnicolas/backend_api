require 'test_helper'

class ProvinciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @provincium = provincia(:one)
  end

  test "should get index" do
    get provincia_url, as: :json
    assert_response :success
  end

  test "should create provincium" do
    assert_difference('Provincium.count') do
      post provincia_url, params: { provincium: { nombre: @provincium.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show provincium" do
    get provincium_url(@provincium), as: :json
    assert_response :success
  end

  test "should update provincium" do
    patch provincium_url(@provincium), params: { provincium: { nombre: @provincium.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy provincium" do
    assert_difference('Provincium.count', -1) do
      delete provincium_url(@provincium), as: :json
    end

    assert_response 204
  end
end
