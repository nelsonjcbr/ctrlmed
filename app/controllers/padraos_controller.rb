class PadraosController < ApplicationController
  before_action :set_padrao, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Padrão", :padraos_path

  # GET /padraos
  # GET /padraos.json
  def index
    @padraos = Padrao.all
    add_breadcrumb "index", padraos_path, :title => "Volta para o index"
  end

  # GET /padraos/1
  # GET /padraos/1.json
  def show
    add_breadcrumb "show", padraos_path, :title => "Volta para o index"
  end

  # GET /padraos/new
  def new
    @padrao = Padrao.new
    add_breadcrumb "novo", padraos_path, :title => "Volta para o index"
  end

  # GET /padraos/1/edit
  def edit
    add_breadcrumb "edit", padraos_path, :title => "Volta para o index"
  end

  # POST /padraos
  # POST /padraos.json
  def create
    @padrao = Padrao.new(padrao_params)

    respond_to do |format|
      if @padrao.save
        format.html { redirect_to @padrao, notice: 'Padrao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @padrao }
      else
        format.html { render action: 'new' }
        format.json { render json: @padrao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /padraos/1
  # PATCH/PUT /padraos/1.json
  def update
    respond_to do |format|
      if @padrao.update(padrao_params)
        format.html { redirect_to @padrao, notice: 'Padrao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @padrao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /padraos/1
  # DELETE /padraos/1.json
  def destroy
    @padrao.destroy
    respond_to do |format|
      format.html { redirect_to padraos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_padrao
      @padrao = Padrao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def padrao_params
      params.require(:padrao).permit(:campo, :valores)
    end
end
