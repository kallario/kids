json.extract! evento, :id, :pessoa_id, :responsavel_id, :data_evento, :tipo_evento, :created_at, :updated_at
json.url evento_url(evento, format: :json)
