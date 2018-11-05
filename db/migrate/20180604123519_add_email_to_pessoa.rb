class AddEmailToPessoa < ActiveRecord::Migration[5.2]
  def change
    add_column :pessoas, :email, :string
  end
end
