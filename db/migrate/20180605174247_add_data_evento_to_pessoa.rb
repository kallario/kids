class AddDataEventoToPessoa < ActiveRecord::Migration[5.2]
  def change
    add_column :pessoas, :data_evento, :datetime
  end
end
