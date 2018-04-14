require 'test_helper'

class PersonasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get personas_url, as: :json
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post personas_url, params: { persona: { apellido: @persona.apellido, dni: @persona.dni, nombre: @persona.nombre } }, as: :json
    end

    assert_response 201
  end

  test "should show persona" do
    get persona_url(@persona), as: :json
    assert_response :success
  end

  test "should update persona" do
    patch persona_url(@persona), params: { persona: { apellido: @persona.apellido, dni: @persona.dni, nombre: @persona.nombre } }, as: :json
    assert_response 200
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete persona_url(@persona), as: :json
    end

    assert_response 204
  end
end
