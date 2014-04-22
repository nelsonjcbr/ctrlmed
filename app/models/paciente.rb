class Paciente < ActiveRecord::Base
  has_many :receitas
  has_many :solexames

  cattr_reader :per_page
  @@per_page = 20

  validates_presence_of :nm_paciente

  include FuncoesData

  def idade
    inoIdade(dt_nascimento) unless dt_nascimento.nil?
  end

  before_create do
    self.dt_prim_consulta = Date.today if dt_prim_consulta.blank?
  end

  before_update do
    self.dt_ult_consulta = Date.today 
  end

end
