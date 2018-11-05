class Evento < ApplicationRecord
  belongs_to :pessoa

  scope :diario, ->(){ where('data_evento >= ? and data_evento <= ?', Time.now.at_beginning_of_day, Time.now.at_end_of_day ) }
  scope :semanal, ->(){ where('data_evento >= ? and data_evento <= ?', Time.now.at_beginning_of_week, Time.now.at_end_of_week) }
  scope :mensal, ->(){ where('data_evento >= ? and data_evento <= ?', Time.now.at_beginning_of_month, Time.now.at_end_of_month) }

  def self.to_csv
    attributes = %w{ data_formatada tipo_evento_string nome_crianca nome_responsavel }
    CSV.generate(headers: true, col_sep: ";") do |csv|
      csv << attributes     
      all.each do |evento|
        csv << attributes.map{|attr| evento.send(attr)}
      end
    end
  end

  def nome_responsavel
  	pessoas = Pessoa.find(responsavel_id)
  	pessoas.primeiro_nome + ' ' + pessoas.sobrenome
  end  

  def nome_crianca
    pessoas = Pessoa.find(pessoa_id)
    pessoas.primeiro_nome + ' ' + pessoas.sobrenome
  end

  def data_formatada
     data_evento.strftime('%d/%m/%Y %H:%M')
  end

  def tipo_evento_string
    if tipo_evento == 1
    	'ENTRADA'
    else
    	'SAIDA'
    end
  end
end
