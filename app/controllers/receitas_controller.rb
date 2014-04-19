class ReceitasController < ApplicationController
  before_filter :ler_pacientes, :only => [:new, :create, :edit, :update]
  before_filter :ler_medicamentos, :only => [:new, :create, :edit, :update]

  # GET /receitas
  # GET /receitas.xml
  def index
    debugger
    @receitas = Receita.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receitas }
    end
  end

  # GET /receitas/1
  # GET /receitas/1.xml
  def show
    @receita = Receita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receita }
    end
  end

  # GET /receitas/new
  # GET /receitas/new.xml
  def new
    @receita = Receita.new
    #2.times { @receita.receitais.build }
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receita }
    end
  end

  # GET /receitas/1/edit
  def edit
    @receita = Receita.find(params[:id])
  end

  # POST /receitas
  # POST /receitas.xml
  def create
    debugger
    @receita = Receita.new(params[:receita])

    respond_to do |format|
      if @receita.save
        flash[:notice] = 'Receita was successfully created.'
        format.html { redirect_to(@receita) }
        format.xml  { render :xml => @receita, :status => :created, :location => @receita }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receita.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receitas/1
  # PUT /receitas/1.xml
  def update
    debbuger
    @receita = Receita.find(params[:id])

    respond_to do |format|
      if @receita.update_attributes(params[:receita])
        flash[:notice] = 'Receita was successfully updated.'
        format.html { redirect_to(@receita) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receita.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receitas/1
  # DELETE /receitas/1.xml
  def destroy
    @receita = Receita.find(params[:id])
    @receita.destroy

    respond_to do |format|
      format.html { redirect_to(@receita.paciente, :controller => :pacientes) }
      format.xml  { head :ok }
    end
  end

  def generate_report
    table = Receita.report_table(:all,
      :only       => %w[data paciente_id receita_id])
#      :order      => "descricao, quarto_id, leito_id")

    grouping = Grouping(table, :by => "receita_id")

#    quarto_leito = Table(%w[setor quarto qtde])

#    grouping.each do |name, group|

#    Grouping(group, :by => "quarto_id").each do |vname, group|
#        quarto_leito << {"setor" => name,
#                          "quarto" => vname,
#                          "qtde" => group.length
#        }
#      end
#    end

#    ordem = quarto_leito.sort_rows_by("leito_id", :order => :descending )

#    g = Grouping(ordem, :by => "quarto")

#    send_data g.to_pdf,
    send_data grouping.to_pdf,
      :type         => "application/pdf",
      :disposition => "inline",
      :filename     => "report.pdf"
  end

 def get_doses2
   debugger
   @med = Medicamento.find( params[:medicamento_id], :select => 'dose' )
#   render :inline => "<%= receitai_form.text_field :dose %>"
   render :inline => "<%= text_field :receitai, :dose, 'tt' %>"
 end
 def get_doses
   @doses = Medicamento.find(:all, :conditions => {:id => params[:medicamento_id]}).collect {|c| [c.dose]}
  render :inline => "<%= @doses %>"
#   render :inline =>  '<%= receitai_form.select :dose, "Todos"  %>'
#   render :inline => "<%= select :receitai[], :dose, options_for_select(@doses) %>"
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

  def ler_medicamentos
    @medicamentos = Medicamento.find(:all).collect { |c| [c.descricao, c.id] }
  end

end
