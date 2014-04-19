class PadraosController < ApplicationController
  # GET /padraos
  # GET /padraos.xml
  def index
    @padraos = Padrao.find(:all)
    @padrao = Padrao.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @padraos }
    end
  end

  # GET /padraos/1
  # GET /padraos/1.xml
  def show
    @padrao = Padrao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @padrao }
    end
  end

  # GET /padraos/new
  # GET /padraos/new.xml
  def new
    @padrao = Padrao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @padrao }
    end
  end

  # GET /padraos/1/edit
  def edit
    @padrao = Padrao.find(params[:id])
  end

  # POST /padraos
  # POST /padraos.xml
  def create
    @padrao = Padrao.new(params[:padrao])

    respond_to do |format|
      if @padrao.save
        flash[:notice] = 'Padrao was successfully created.'
        format.html { redirect_to(@padrao) }
        format.xml  { render :xml => @padrao, :status => :created, :location => @padrao }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @padrao.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /padraos/1
  # PUT /padraos/1.xml
  def update
    @padrao = Padrao.find(params[:id])

    respond_to do |format|
      if @padrao.update_attributes(params[:padrao])
        flash[:notice] = 'Padrao was successfully updated.'
        format.html { redirect_to(@padrao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @padrao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /padraos/1
  # DELETE /padraos/1.xml
  def destroy
    @padrao = Padrao.find(params[:id])
    @padrao.destroy

    respond_to do |format|
      #format.html { redirect_to(padraos_url) }
      #format.xml  { head :ok }
      format.js
    end
  end
end
