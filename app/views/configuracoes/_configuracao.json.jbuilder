json.extract! configuracao, :id, :nome_empresa, :quiosque, :turmas, :salas, :usar_impressora, :nome_impressora, :layout_etiqueta, :usar_fotos, :created_at, :updated_at
json.url configuracao_url(configuracao, format: :json)
