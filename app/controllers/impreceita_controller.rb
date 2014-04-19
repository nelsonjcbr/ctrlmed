class ImpreceitaController < ApplicationController

  # GET /receitas/1
  # GET /receitas/1.xml
  def show
    @receita = Receita.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receita }
    end
  end

end
