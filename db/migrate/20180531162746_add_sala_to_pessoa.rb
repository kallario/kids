class AddSalaToPessoa < ActiveRecord::Migration[5.2]
  def change
    add_reference :pessoas, :turma, foreign_key: true
    add_reference :pessoas, :sala, foreign_key: true
  end
end
