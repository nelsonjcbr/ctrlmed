class Receitai < ActiveRecord::Base
  #acts_as_reportable

  belongs_to :receita
  belongs_to :medicamento

  before_create :atualiza_dose

  def atualiza_dose
    if self.dose.nil? || self.dose == ''
      @med = Medicamento.find( self.medicamento_id )
      self.dose = @med.dose
    end
  end

end
