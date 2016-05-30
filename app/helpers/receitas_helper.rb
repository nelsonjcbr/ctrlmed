module ReceitasHelper
  def add_receitais_link(nome)
    link_to_function nome do |page|
      page.insert_html :bottom, :receitais, :partial => 'receitai', :object => Receitai.new
    end
  end
end
