class MedicamentosController < ApplicationController
  before_filter :ler_viaaplic, :only => [:new, :create, :edit, :update]

  # GET /medicamentos
  # GET /medicamentos.xml
  def index
    @medicamentos = Medicamento.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medicamentos }
    end
  end

  # GET /medicamentos/1
  # GET /medicamentos/1.xml
  def show
    @medicamento = Medicamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medicamento }
    end
  end

  # GET /medicamentos/new
  # GET /medicamentos/new.xml
  def new
    @medicamento = Medicamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medicamento }
    end
  end

  # GET /medicamentos/1/edit
  def edit
    @medicamento = Medicamento.find(params[:id])
  end

  # POST /medicamentos
  # POST /medicamentos.xml
  def create
    @medicamento = Medicamento.new(params[:medicamento])

    respond_to do |format|
      if @medicamento.save
        flash[:notice] = 'Medicamento was successfully created.'
        format.html { redirect_to(@medicamento) }
        format.xml  { render :xml => @medicamento, :status => :created, :location => @medicamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medicamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medicamentos/1
  # PUT /medicamentos/1.xml
  def update
    @medicamento = Medicamento.find(params[:id])

    respond_to do |format|
      if @medicamento.update_attributes(params[:medicamento])
        flash[:notice] = 'Medicamento was successfully updated.'
        format.html { redirect_to(@medicamento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medicamento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medicamentos/1
  # DELETE /medicamentos/1.xml
  def destroy
    @medicamento = Medicamento.find(params[:id])
    @medicamento.destroy

    respond_to do |format|
      format.html { redirect_to(medicamentos_url) }
      format.xml  { head :ok }
    end
  end

  protected
  def ler_viaaplic
    @vias = Viaaplic.find(:all).collect {|p| [p.descricao, p.id] }
  end
end
