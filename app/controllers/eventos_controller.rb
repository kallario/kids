class EventosController < ApplicationController

  def index
    @pessoas = Pessoa.where(checkin: true)
  end

  def historico
    if !params[:frequencia].present?
      frq = '0'
    else
      frq = params[:frequencia]
    end
    @pessoa = Pessoa.find(params[:pessoa_id]);
    @eventos = Evento.where(pessoa_id: params[:pessoa_id]).order(:data_evento)
    @eventos = Evento.diario.where(pessoa_id: params[:pessoa_id]).order(:data_evento) if frq === '1'
    @eventos = Evento.semanal.where(pessoa_id: params[:pessoa_id]).order(:data_evento) if frq === '2'
    @eventos = Evento.mensal.where(pessoa_id: params[:pessoa_id]).order(:data_evento) if frq === '3'
    respond_to do |format|
      format.html
      format.csv { send_data @eventos.to_csv, filename: "checkin-#{Date.today}.csv" } 
    end
  end

  def checkin
    @pessoas = Pessoa.where(familia_id: params[:pessoa_id]).order(:grupo, :primeiro_nome)
    @evento = Evento.new
  end

  def checkout
    @pessoas = Pessoa.where(familia_id: params[:pessoa_id]).order(:grupo, :primeiro_nome)
    @evento = Evento.new
  end  

  def checkout_all
    Pessoa.update_all(checkin: false, data_evento: Time.now )
    redirect_to pessoas_url, notice: 'Checkout realizado com sucesso.'
  end

  def processar_checkin
  	if params[:pessoa_ids].present?
  		params[:pessoa_ids].each do |id|
  		   evento = Evento.new(pessoa_id: id, responsavel_id: params[:responsavel_id], data_evento: params[:data], tipo_evento: params[:tipo])
  		   evento.save
  		end	
  		@pessoas = Pessoa.where(id: params[:pessoa_ids]).update_all(checkin: params[:tipo] == '1', data_evento: params[:data] )
    end
    redirect_to eventos_url, notice: 'Evento criado com sucesso.'
  end

end
