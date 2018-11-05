class ConfiguracoesController < ApplicationController
  # GET /configuracoes/1/edit
  def index
    @configuracao = Configuracao.find(1)
  end

  # PATCH/PUT /configuracoes/1
  # PATCH/PUT /configuracoes/1.json
  def update
    @configuracao = Configuracao.find(1)
    respond_to do |format|
      if @configuracao.update(configuracao_params)
        format.html { redirect_to configuracoes_path, notice: 'Configuração atualizada com sucesso.' }
        format.json { render :index, status: :ok, location: @configuracao }
      else
        format.html { render :edit }
        format.json { render json: @configuracao.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def configuracao_params
      params.require(:configuracao).permit(:nome_empresa, :quiosque, :turmas, :salas, :usar_impressora, :nome_impressora, :layout_etiqueta, :usar_fotos)
    end
end
