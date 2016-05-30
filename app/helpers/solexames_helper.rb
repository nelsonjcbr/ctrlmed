module SolexamesHelper
  def add_solexameis_link(nome)
    link_to_function nome do |page|
      page.insert_html :bottom, :solexameis, :partial => 'solexamei', :object => Solexamei.new
    end
  end
end
