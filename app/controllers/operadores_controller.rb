class OperadoresController < ApplicationController

before_action :find, only: [:edit, :update, :destroy]
before_action :set_options_for_select, only: [:new, :edit, :update, :create]

  def show
    @operador = Operador.find(params[:user])
    
  end

  
  # GET /operadors/new
  def new
    @operador = Operador.new
  end

  def index
    @operadores = Operador.all
  end

  # GET /operadors/1/edit
  def edit
  end

  # POST /operadors
  # POST /operadors.json
  def create
    @operador = Operador.new(operador_params)

    @operador.valid?

    respond_to do |format|
      if @operador.save
        format.html { redirect_to @operador, notice: 'Operador cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @operador }
      else
        format.html { render :new }
        format.json { render json: @operador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operadors/1
  # PATCH/PUT /operadors/1.json
  def update
    respond_to do |format|
      if @operador.update(operador_params)
        format.html { redirect_to @operador, notice: 'Operador atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @operador }
      else
        format.html { render :edit }
        format.json { render json: @operador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operadors/1
  # DELETE /operadors/1.json
  def destroy
    @operador.destroy
    respond_to do |format|
      format.html { redirect_to operadors_url, notice: 'Operador removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find
      @operador = Operador.find(params[:id])
   end

   def set_options_for_select
    @tipos_opstions_for_select = OperadorTipo.all
   end

    # Never trust parameters from the scary internet, only allow the white list through.
  def operador_params
      params.require(:operador).permit(:user, :password, :operador_tipo_id)
  end
end
