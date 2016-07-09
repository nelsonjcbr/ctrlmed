class PacientesController < ApplicationController

  before_filter :ler_estados_civis
  before_filter :ler_cidades

  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  add_breadcrumb "Home" , :root_path
  add_breadcrumb "Pacientes", :pacientes_path
 
  # controller
  #def auto_complete_for_paciente_cidade
  #  auto_complete_responder_for_cidade params[:paciente][:cidade]
  #end

  # GET /pacientes
  # GET /pacientes.xml
  def index
    #byebug
    condicao ="id > 0"
    unless params[:paciente_filtro].nil? 
      filtro = params[:paciente_filtro].gsub(/[ ]/, '%')
      condicao += " and nm_paciente  ilike   '#{filtro}%'" 
    end
    
    @totalpacientes = Paciente.count
    @pacientes = Paciente.paginate(:page => params[:page])
                         .where(condicao)
                         .order(:nm_paciente)
#                        .order(dt_ult_consulta: :desc)
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    add_breadcrumb "show", pacientes_path, :title => "Volta para o index"
  end

  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @paciente = Paciente.new(dt_prim_consulta: Date.today)
    add_breadcrumb "novo", pacientes_path, :title => "Volta para o index"
  end

  # GET /pacientes/1/edit
  def edit
    add_breadcrumb "edit", pacientes_path, :title => "Volta para o index"
  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        flash[:notice] = 'Paciente was successfully created.'
        format.html { redirect_to(@paciente) }
        format.json  { render action: 'show', :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :json => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente alterado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.xml
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url }
      format.json { head :no_content }
    end
  end
  
  def idade
    unless params[:dt_nascimento].blank?
      if params[:dt_nascimento].length > 9
       render :text => 'Idade: ' + inoIdade(params[:dt_nascimento])
      else
       render :text => 'Data incompleta'
      end
    end
  end

  protected

  def ler_estados_civis
    #@aux = Padrao.find.(:all, :conditions => ['campo = ?', 'estado_civil'])
    @aux = %w(Solteiro Casado Viuvo Amasiado)
    @estado_civis = @aux
  end

  def ler_cidades
    @cidades = Padrao.select('valores').where(['LOWER(campo) = ? ', 'cidade' ]).first
  end

  private
  def auto_complete_responder_for_cidade(value)

    # pega caracteres de fim de linha
    fimLinha = 13.chr+10.chr
    cadaLinha = @cidades.valores.split(fimLinha)

    @cidadefiltro = []
    for s in cadaLinha.grep(/#{value}/) # navega em cada linha que contem o digitado
      @cidadefiltro << Padrao.new(:valores=>s)
    end
    
    debugger
    render :inline => "<%= auto_complete_result(@cidadefiltro, 'valores') %>"
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      #params[:paciente]
      params.require(:paciente).permit(:nm_paciente, :dt_nascimento, :estado_civil, :endereco, :cidade,
        :profissao, :fone_casa, :e_mail, :dt_prim_consulta, :situacao, :encaminhado_por, :obs1, :obs2, :obs3, :obs4, :obs5,
        :antec_pai, :antec_mae, :antec_irmaos, :antec_conjuge, :antec_filhos)
    end

end
