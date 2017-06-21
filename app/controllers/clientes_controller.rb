class ClientesController < ApplicationController

	before_action :find, only: [:edit, :update, :destroy]

	def show
		@cliente = Cliente.find(params[:id])
    @emprestimos = @cliente.emprestimos
    # logger.debug "Mostrando o nome do cliente: #{@cliente.nome}"
    # logger.info "#{@cliente}"
	end

  def show_by_cpf
    @cliente = Cliente.find_by cpf: params[:cpf]
  end

  
  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @cliente.build_endereco
    # logger.debug "#{@cliente.data_nasc}"
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    @cliente.valid?

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(
          :nome, :cpf, :rg, :data_nasc, :matricula, :senha, :orgao, :tel, :tel2, :convenio, :email,
          endereco_attributes: [:rua, :numero, :complemento, :bairro, :cidade, :estado, :cep],
          emprestimos_attributes: [:banco, :valor, :corretora, :qnt_parcelas, :valor_parcelas, :data_emprestimo, :id, :_destroy]
        )
    end
end
