class SolexamesController < ApplicationController
  before_filter :ler_pacientes, :only => [:new, :create, :edit, :update]
  before_filter :ler_exames, :only => [:new, :create, :edit, :update]
  before_filter :ler_clinicas_laboratorios, :only => [:new, :create, :edit, :update]

  # GET /solexames
  # GET /solexames.xml
  def index
    debugger
    @solexames = Solexame.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solexames }
    end
  end

  # GET /solexames/1
  # GET /solexames/1.xml
  def show
    @solexame = Solexame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solexame }
    end
  end

  # GET /solexames/new
  # GET /solexames/new.xml
  def new
    @solexame = Solexame.new
    2.times { @solexame.solexameis.build }
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solexame }
    end
  end

  # GET /solexames/1/edit
  def edit
    @solexame = Solexame.find(params[:id])
  end

  # POST /solexames
  # POST /solexames.xml
  def create
    @solexame = Solexame.new(params[:solexame])

    respond_to do |format|
      if @solexame.save
        flash[:notice] = 'Solexame was successfully created.'
        format.html { redirect_to(@solexame) }
        format.xml  { render :xml => @solexame, :status => :created, :location => @solexame }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solexame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /solexames/1
  # PUT /solexames/1.xml
  def update
    @solexame = Solexame.find(params[:id])

    respond_to do |format|
      if @solexame.update_attributes(params[:solexame])
        flash[:notice] = 'Solexame was successfully updated.'
        format.html { redirect_to(@solexame) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solexame.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /solexames/1
  # DELETE /solexames/1.xml
  def destroy
    @solexame = Solexame.find(params[:id])
    @solexame.destroy

    respond_to do |format|
      format.html { redirect_to(@solexame.paciente, :controller => :pacientes) }
      format.xml  { head :ok }
    end
  end

  private

  def ler_pacientes
    debugger
    paciente_id = params['paciente']
    if paciente_id.nil?
      @pacientes = Paciente.find(:all, :limit=>2).collect { |c| [ c.nm_paciente, c.id] }
    else
      @pacientes = Paciente.find( :all,
                                  :limit=>2,
                                  :conditions=>"id=#{paciente_id}" ).collect { |c| [ c.nm_paciente, c.id] }
    end
  end

  def ler_exames
    @exames = Exame.find(:all, :order => 'descricao').collect { |c| [c.descricao, c.id] }
  end

  def ler_clinicas_laboratorios
    @clilabs = Clilab.find(:all).collect { |c| [c.nm, c.id] }
  end

end
