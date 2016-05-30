class Receita < ActiveRecord::Base
  #acts_as_reportable

  belongs_to :paciente
  has_many :receitais
  accepts_nested_attributes_for :receitais, allow_destroy: true

end
