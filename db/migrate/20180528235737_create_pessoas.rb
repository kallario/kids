class CreatePessoas < ActiveRecord::Migration[5.2]
  def change
    create_table :pessoas do |t|
      t.integer :grupo, null: false, default: 1
      
      #Dados da Família
      t.string :familia
      t.string :telefone 
      t.string :endereco
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado 
      t.string :cep
      t.integer :password

      #Dados do Responsável / Criança
      t.string :primeiro_nome
      t.string :celular
      t.boolean :receber_sms

      #Dados da Criança
      t.string :sexo
      t.date :nascimento
      t.text :observacoes
      t.integer :familia_id

      t.timestamps
    end
  end
end
