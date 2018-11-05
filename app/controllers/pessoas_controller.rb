class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]

  # GET /responsaveis
  # GET /responsaveis.json
  def index
    @pessoas = Pessoa.all.order(:familia_id, :grupo)
  end

  # GET /responsaveis/1
  # GET /responsaveis/1.json
  def show
  end

  # GET /responsaveis/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /responsaveis/1/edit
  def edit
  end

  def nova_familia
    @pessoa = Pessoa.new
  end

  def editar_familia
    @pessoa = Pessoa.find(params[:pessoa_id])
  end  

  def novo_responsavel
    @familia = Pessoa.find(params[:pessoa_id])
    @pessoa = Pessoa.new
  end

  def editar_responsavel
    @pessoa = Pessoa.find(params[:pessoa_id])
    @familia = Pessoa.find(@pessoa.familia_id)
  end  

  def nova_crianca
    @familia = Pessoa.find(params[:pessoa_id])
    @pessoa = Pessoa.new
  end

  def editar_crianca
    @pessoa = Pessoa.find(params[:pessoa_id])
    @familia = Pessoa.find(@pessoa.familia_id)
  end  


  # POST /responsaveis
  # POST /responsaveis.json
  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
      	if @pessoa.grupo == 1 then
      	  @pessoa = Pessoa.find(@pessoa.id).update(familia_id: @pessoa.id)
      	end
        format.html { redirect_to pessoas_path, notice: 'Pessoa criada com sucesso.' }
        format.json { render :index, status: :created, location: @Pessoa }
      else
        format.html { render :new }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsaveis/1
  # PATCH/PUT /responsaveis/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to pessoas_path, notice: 'Pessoa atualizada com sucesso.' }
        format.json { render :index, status: :ok, location: @Pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsaveis/1
  # DELETE /responsaveis/1.json
  def destroy
    @pessoa.destroy
    respond_to do |format|
      format.html { redirect_to responsaveis_url, notice: 'Pessoa excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:familia, :grupo, :primeiro_nome, :celular, :receber_sms, :endereco, :numero, :complemento, :bairro, :cidade, :estado, :cep, :sexo, :nascimento, :telefone, :password, :familia_id, :sala_id, :turma_id, :email)
    end
end
