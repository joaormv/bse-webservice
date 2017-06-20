class EmprestimosController < ApplicationController

	before_action :find, only: [:edit, :update, :destroy]

	def show
		@emprestimos = Cliente.find(params[:id]).emprestimos
    # logger.debug "Mostrando o nome do emprestimo: #{@emprestimos.nome}"
    # logger.info "#{@emprestimos}"
	end

  def show_by_cpf
    @emprestimos = Cliente.find_by (cpf: params[:cpf]).emprestimos
  end

  
  # GET /emprestimos
  # GET /emprestimos.json
  def index
    @emprestimos = Emprestimo.all
  end

  # GET /emprestimos/new
  def new
    @emprestimo = Emprestimo.new
    # logger.debug "#{@emprestimos.data_nasc}"
  end

  # GET /emprestimos/1/edit
  def edit
  end

  # POST /emprestimos
  # POST /emprestimos.json
  def create
    @emprestimo = Emprestimo.new(emprestimo_params)

    @emprestimo.valid?

    respond_to do |format|
      if @emprestimo.save
        format.html { redirect_to @emprestimo, notice: 'emprestimo cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        format.html { render :new }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emprestimos/1
  # PATCH/PUT /emprestimos/1.json
  def update
    respond_to do |format|
      if @emprestimos.update(emprestimo_params)
        format.html { redirect_to @emprestimo, notice: 'emprestimo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @emprestimo }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprestimos/1
  # DELETE /emprestimos/1.json
  def destroy
    @emprestimo.destroy
    respond_to do |format|
      format.html { redirect_to emprestimo_url, notice: 'emprestimo removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find
      @emprestimo = Cliente.find(params[:id]).emprestimos(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_params
      params.require(:emprestimo).permit(:valor, :qnt_parcelas, :valor_parcelas, :banco, :corretora, :data_emprestimo)
    end
end