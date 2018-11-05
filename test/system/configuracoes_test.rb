require "application_system_test_case"

class ConfiguracoesTest < ApplicationSystemTestCase
  setup do
    @configuracao = configuracoes(:one)
  end

  test "visiting the index" do
    visit configuracoes_url
    assert_selector "h1", text: "Configuracoes"
  end

  test "creating a Configuracao" do
    visit configuracoes_url
    click_on "New Configuracao"

    fill_in "Layout Etiqueta", with: @configuracao.layout_etiqueta
    fill_in "Nome Empresa", with: @configuracao.nome_empresa
    fill_in "Nome Impressora", with: @configuracao.nome_impressora
    fill_in "Quiosque", with: @configuracao.quiosque
    fill_in "Salas", with: @configuracao.salas
    fill_in "Turmas", with: @configuracao.turmas
    fill_in "Usar Fotos", with: @configuracao.usar_fotos
    fill_in "Usar Impressora", with: @configuracao.usar_impressora
    click_on "Create Configuracao"

    assert_text "Configuracao was successfully created"
    click_on "Back"
  end

  test "updating a Configuracao" do
    visit configuracoes_url
    click_on "Edit", match: :first

    fill_in "Layout Etiqueta", with: @configuracao.layout_etiqueta
    fill_in "Nome Empresa", with: @configuracao.nome_empresa
    fill_in "Nome Impressora", with: @configuracao.nome_impressora
    fill_in "Quiosque", with: @configuracao.quiosque
    fill_in "Salas", with: @configuracao.salas
    fill_in "Turmas", with: @configuracao.turmas
    fill_in "Usar Fotos", with: @configuracao.usar_fotos
    fill_in "Usar Impressora", with: @configuracao.usar_impressora
    click_on "Update Configuracao"

    assert_text "Configuracao was successfully updated"
    click_on "Back"
  end

  test "destroying a Configuracao" do
    visit configuracoes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Configuracao was successfully destroyed"
  end
end
