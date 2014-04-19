class PacientesController < ApplicationController
  before_filter :ler_estados_civis
  before_filter :ler_cidades
  
  # controller
  def auto_complete_for_paciente_cidade
    auto_complete_responder_for_cidade params[:paciente][:cidade]
  end

  protect_from_forgery :only => [:update, :delete, :create] # exclude the auto_complete method 
  
  # GET /pacientes
  # GET /pacientes.xml
  def index
    condicao ="id > 0"
    unless params[:paciente_filtro].nil? 
      condicao += " and nm_paciente  ilike   '%#{params[:paciente_filtro]}%'" 
    end

    @pacientes = Paciente.paginate :page => params[:page], :order => 'nm_paciente', :conditions => condicao

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pacientes }
    end
  end

  # GET /pacientes/1
  # GET /pacientes/1.xml
  def show
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/new
  # GET /pacientes/new.xml
  def new
    @paciente = Paciente.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paciente }
    end
  end

  # GET /pacientes/1/edit
  def edit
    @paciente = Paciente.find(params[:id])
  end

  # POST /pacientes
  # POST /pacientes.xml
  def create
    @paciente = Paciente.new(params[:paciente])

    respond_to do |format|
      if @paciente.save
        flash[:notice] = 'Paciente was successfully created.'
        format.html { redirect_to(@paciente) }
        format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pacientes/1
  # PUT /pacientes/1.xml
  def update
    @paciente = Paciente.find(params[:id])

    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])
        flash[:notice] = 'Paciente was successfully updated.'
        format.html { redirect_to(@paciente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.xml
  def destroy
    @paciente = Paciente.find(params[:id])
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to(pacientes_url) }
      format.xml  { head :ok }
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
    @aux = Padrao.find(:all, :conditions => ['campo = ?', 'estado_civil'])
    @aux = %w(Solteiro Casado Tico-Tico)
    @estado_civis = @aux
  end

  def ler_cidades
    @cidades = Padrao.find(:first, 
                          :select => [:valores],
                          :conditions => ['LOWER(campo) = ? ', 'cidade' ]) 
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

end
