class ExamesController < ApplicationController

  before_action :set_exame, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Exames", :exames_path

  # GET /exames
  # GET /exames.xml
  def index
    @exames = Exame.all
  end

  # GET /exames/1
  # GET /exames/1.xml
  def show
    add_breadcrumb "show", exames_path, :title => "Volta para o index"
  end

  # GET /exames/new
  # GET /exames/new.xml
  def new
    @exame = Exame.new
    add_breadcrumb "novo", exames_path, :title => "Volta para o index"
  end

  # GET /exames/1/edit
  def edit
    add_breadcrumb "edit", exames_path, :title => "Volta para o index"
  end

  # POST /exames
  # POST /exames.xml
  def create
    @exame = Exame.new(exame_params)

    respond_to do |format|
      if @exame.save
        format.html { redirect_to @exame, notice: 'Exame foi criado com sucesso.' }
        format.json { render action: 'show', status: :created, location: @exame }
      else
        format.html { render action: 'new' }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exames/1
  # PUT /exames/1.xml
  def update
   respond_to do |format|
      if @exame.update(exame_params)
        format.html { redirect_to @exame, notice: 'Exame foi gravado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exames/1
  # DELETE /exames/1.xml
 def destroy
    @exame.destroy
    respond_to do |format|
      format.html { redirect_to exames_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exame
      @exame = Exame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exame_params
      params.require(:exame).permit(:descricao)
      #params[:exame]
    end
end
