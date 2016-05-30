class MedicamentosController < ApplicationController

  before_filter :ler_viaaplic, :only => [:new, :create, :edit, :update]
  before_action :set_medicamento, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Medicamento", :medicamentos_path

  # GET /medicamentos
  # GET /medicamentos.xml
  def index
    @medicamentos = Medicamento.all
  end

  # GET /medicamentos/1
  # GET /medicamentos/1.xml
  def show
    add_breadcrumb "show", medicamentos_path, :title => "Volta para o index"
  end

  # GET /medicamentos/new
  # GET /medicamentos/new.xml
  def new
    @medicamento = Medicamento.new
    add_breadcrumb "novo", medicamentos_path, :title => "Volta para o index"
  end

  # GET /medicamentos/1/edit
  def edit
    add_breadcrumb "edit", medicamentos_path, :title => "Volta para o index"
  end

  # POST /medicamentos
  # POST /medicamentos.xml
  def create
    @medicamento = Medicamento.new(medicamento_params)

    respond_to do |format|
      if @medicamento.save
        format.html { redirect_to @medicamento, notice: 'Medicamento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medicamento }
      else
        format.html { render action: 'new' }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medicamentos/1
  # PUT /medicamentos/1.xml
  def update
    respond_to do |format|
      if @medicamento.update(medicamento_params)
        format.html { redirect_to @medicamento, notice: 'Medicamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medicamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicamentos/1
  # DELETE /medicamentos/1.xml
  def destroy
    @medicamento.destroy
    respond_to do |format|
      format.html { redirect_to medicamentos_url }
      format.json { head :no_content }
    end
  end

  protected
    def ler_viaaplic
      @vias = Viaaplic.all.collect {|p| [p.descricao, p.id] }
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_medicamento
      @medicamento = Medicamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicamento_params
      params.require(:medicamento).permit(:descricao, :dose, :viaaplic_id)
      #params[:viaaplic]
    end

end
