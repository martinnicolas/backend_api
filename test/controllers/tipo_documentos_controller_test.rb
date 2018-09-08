require 'test_helper'

class TipoDocumentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_documento = tipo_documentos(:one)
  end

  test "should get index" do
    get tipo_documentos_url, as: :json
    assert_response :success
  end

  test "should create tipo_documento" do
    assert_difference('TipoDocumento.count') do
      post tipo_documentos_url, params: { tipo_documento: { descripcion: @tipo_documento.descripcion } }, as: :json
    end

    assert_response 201
  end

  test "should show tipo_documento" do
    get tipo_documento_url(@tipo_documento), as: :json
    assert_response :success
  end

  test "should update tipo_documento" do
    patch tipo_documento_url(@tipo_documento), params: { tipo_documento: { descripcion: @tipo_documento.descripcion } }, as: :json
    assert_response 200
  end

  test "should destroy tipo_documento" do
    assert_difference('TipoDocumento.count', -1) do
      delete tipo_documento_url(@tipo_documento), as: :json
    end

    assert_response 204
  end
end
