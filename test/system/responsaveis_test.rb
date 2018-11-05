require "application_system_test_case"

class ResponsaveisTest < ApplicationSystemTestCase
  setup do
    @responsavel = responsaveis(:one)
  end

  test "visiting the index" do
    visit responsaveis_url
    assert_selector "h1", text: "Responsaveis"
  end

  test "creating a Responsavel" do
    visit responsaveis_url
    click_on "New Responsavel"

    fill_in "Celular", with: @responsavel.celular
    fill_in "Familia", with: @responsavel.familia_id
    fill_in "Primeiro Nome", with: @responsavel.primeiro_nome
    fill_in "Receber Sms", with: @responsavel.receber_sms
    click_on "Create Responsavel"

    assert_text "Responsavel was successfully created"
    click_on "Back"
  end

  test "updating a Responsavel" do
    visit responsaveis_url
    click_on "Edit", match: :first

    fill_in "Celular", with: @responsavel.celular
    fill_in "Familia", with: @responsavel.familia_id
    fill_in "Primeiro Nome", with: @responsavel.primeiro_nome
    fill_in "Receber Sms", with: @responsavel.receber_sms
    click_on "Update Responsavel"

    assert_text "Responsavel was successfully updated"
    click_on "Back"
  end

  test "destroying a Responsavel" do
    visit responsaveis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Responsavel was successfully destroyed"
  end
end
