require 'test_helper'

class ConfiguracoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuracao = configuracoes(:one)
  end

  test "should get index" do
    get configuracoes_url
    assert_response :success
  end

  test "should get new" do
    get new_configuracao_url
    assert_response :success
  end

  test "should create configuracao" do
    assert_difference('Configuracao.count') do
      post configuracoes_url, params: { configuracao: { layout_etiqueta: @configuracao.layout_etiqueta, nome_empresa: @configuracao.nome_empresa, nome_impressora: @configuracao.nome_impressora, quiosque: @configuracao.quiosque, salas: @configuracao.salas, turmas: @configuracao.turmas, usar_fotos: @configuracao.usar_fotos, usar_impressora: @configuracao.usar_impressora } }
    end

    assert_redirected_to configuracao_url(Configuracao.last)
  end

  test "should show configuracao" do
    get configuracao_url(@configuracao)
    assert_response :success
  end

  test "should get edit" do
    get edit_configuracao_url(@configuracao)
    assert_response :success
  end

  test "should update configuracao" do
    patch configuracao_url(@configuracao), params: { configuracao: { layout_etiqueta: @configuracao.layout_etiqueta, nome_empresa: @configuracao.nome_empresa, nome_impressora: @configuracao.nome_impressora, quiosque: @configuracao.quiosque, salas: @configuracao.salas, turmas: @configuracao.turmas, usar_fotos: @configuracao.usar_fotos, usar_impressora: @configuracao.usar_impressora } }
    assert_redirected_to configuracao_url(@configuracao)
  end

  test "should destroy configuracao" do
    assert_difference('Configuracao.count', -1) do
      delete configuracao_url(@configuracao)
    end

    assert_redirected_to configuracoes_url
  end
end
