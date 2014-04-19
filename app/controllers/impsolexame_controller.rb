class ImpsolexameController < ApplicationController
  layout  'impreceita'

  def show
    @solexame = Solexame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solexame }
    end
  end

end
