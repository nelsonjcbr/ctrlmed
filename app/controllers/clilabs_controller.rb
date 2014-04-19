class ClilabsController < ApplicationController
  # GET /clilabs
  # GET /clilabs.xml
  def index
    @clilabs = Clilab.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clilabs }
    end
  end

  # GET /clilabs/1
  # GET /clilabs/1.xml
  def show
    @clilab = Clilab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clilab }
    end
  end

  # GET /clilabs/new
  # GET /clilabs/new.xml
  def new
    @clilab = Clilab.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clilab }
    end
  end

  # GET /clilabs/1/edit
  def edit
    @clilab = Clilab.find(params[:id])
  end

  # POST /clilabs
  # POST /clilabs.xml
  def create
    @clilab = Clilab.new(params[:clilab])

    respond_to do |format|
      if @clilab.save
        flash[:notice] = 'Clilab was successfully created.'
        format.html { redirect_to(@clilab) }
        format.xml  { render :xml => @clilab, :status => :created, :location => @clilab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clilab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clilabs/1
  # PUT /clilabs/1.xml
  def update
    @clilab = Clilab.find(params[:id])

    respond_to do |format|
      if @clilab.update_attributes(params[:clilab])
        flash[:notice] = 'Clilab was successfully updated.'
        format.html { redirect_to(@clilab) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clilab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clilabs/1
  # DELETE /clilabs/1.xml
  def destroy
    @clilab = Clilab.find(params[:id])
    @clilab.destroy

    respond_to do |format|
      format.html { redirect_to(clilabs_url) }
      format.xml  { head :ok }
    end
  end
end
