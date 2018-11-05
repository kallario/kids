require "application_system_test_case"

class TurmasTest < ApplicationSystemTestCase
  setup do
    @turma = turmas(:one)
  end

  test "visiting the index" do
    visit turmas_url
    assert_selector "h1", text: "Turmas"
  end

  test "creating a Turma" do
    visit turmas_url
    click_on "New Turma"

    fill_in "Descricao", with: @turma.descricao
    fill_in "Idade Final", with: @turma.idade_final
    fill_in "Idade Inicial", with: @turma.idade_inicial
    fill_in "Nome Turma", with: @turma.nome_turma
    click_on "Create Turma"

    assert_text "Turma was successfully created"
    click_on "Back"
  end

  test "updating a Turma" do
    visit turmas_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @turma.descricao
    fill_in "Idade Final", with: @turma.idade_final
    fill_in "Idade Inicial", with: @turma.idade_inicial
    fill_in "Nome Turma", with: @turma.nome_turma
    click_on "Update Turma"

    assert_text "Turma was successfully updated"
    click_on "Back"
  end

  test "destroying a Turma" do
    visit turmas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Turma was successfully destroyed"
  end
end
