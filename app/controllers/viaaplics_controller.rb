class ViaaplicsController < ApplicationController
  # GET /viaaplics
  # GET /viaaplics.xml
  def index
    @viaaplics = Viaaplic.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @viaaplics }
    end
  end

  # GET /viaaplics/1
  # GET /viaaplics/1.xml
  def show
    @viaaplic = Viaaplic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @viaaplic }
    end
  end

  # GET /viaaplics/new
  # GET /viaaplics/new.xml
  def new
    @viaaplic = Viaaplic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @viaaplic }
    end
  end

  # GET /viaaplics/1/edit
  def edit
    @viaaplic = Viaaplic.find(params[:id])
  end

  # POST /viaaplics
  # POST /viaaplics.xml
  def create
    @viaaplic = Viaaplic.new(params[:viaaplic])

    respond_to do |format|
      if @viaaplic.save
        flash[:notice] = 'Viaaplic was successfully created.'
        format.html { redirect_to(@viaaplic) }
        format.xml  { render :xml => @viaaplic, :status => :created, :location => @viaaplic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @viaaplic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /viaaplics/1
  # PUT /viaaplics/1.xml
  def update
    @viaaplic = Viaaplic.find(params[:id])

    respond_to do |format|
      if @viaaplic.update_attributes(params[:viaaplic])
        flash[:notice] = 'Viaaplic was successfully updated.'
        format.html { redirect_to(@viaaplic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @viaaplic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /viaaplics/1
  # DELETE /viaaplics/1.xml
  def destroy
    @viaaplic = Viaaplic.find(params[:id])
    @viaaplic.destroy

    respond_to do |format|
      format.html { redirect_to(viaaplics_url) }
      format.xml  { head :ok }
    end
  end
end
