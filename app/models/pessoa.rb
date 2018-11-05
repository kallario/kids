class Pessoa < ApplicationRecord

belongs_to :sala, optional: true
belongs_to :turma, optional: true


has_many :eventos 

scope :responsaveis,   ->(){ where(grupo: 2) }
scope :criancas,       ->(){ where(grupo: 3) }

def idade
  now = Time.now.utc.to_date
  now.year - nascimento.year - ((now.month > nascimento.month || (now.month == nascimento.month && now.day >= nascimento.day)) ? 0 : 1)
end	

def sobrenome
	pessoas = Pessoa.find(familia_id)
	pessoas.familia
end

def nome_completo
  if grupo > 1
  	 [primeiro_nome, sobrenome].join(' ')
  end
end

include PgSearch

pg_search_scope :search, against: [:primeiro_nome, :telefone, :celular],
using: {tsearch: {dictionary: 'portuguese'}},
associated_against: {categoria: :nome_categoria},
ignoring: :accents

end
