class Receita < ActiveRecord::Base
  #acts_as_reportable

  belongs_to :paciente
  has_many :receitais

  def receitai_attributes=(receitai_attributes)
    receitai_attributes.each do |attributes|
      receitais.build(attributes)
    end
  end

end
