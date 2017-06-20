class EnderecosController < ApplicationController

before_action :find, only: [:edit, :update, :destroy]

	def show
		@endereco = endereco.find(params[:id])
    # logger.debug "Mostrando o nome do endereco: #{@endereco.nome}"
    # logger.info "#{@endereco}"
	end

  
  # GET /enderecos/new
  def new
    @endereco = endereco.new
  end

  # GET /enderecos/1/edit
  def edit
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = endereco.new(endereco_params)

    @endereco.valid?

    respond_to do |format|
      if @endereco.save
        format.html { redirect_to @endereco, notice: 'endereco cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @endereco }
      else
        format.html { render :new }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enderecos/1
  # PATCH/PUT /enderecos/1.json
  def update
    respond_to do |format|
      if @endereco.update(endereco_params)
        format.html { redirect_to @endereco, notice: 'endereco atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @endereco }
      else
        format.html { render :edit }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco.destroy
    respond_to do |format|
      format.html { redirect_to enderecos_url, notice: 'endereco removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find
      @endereco = endereco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def endereco_params
      params.require(:endereco).permit(:rua, :numero, :complemento, :bairro, :cidade, :estado, :cep)
    end

end