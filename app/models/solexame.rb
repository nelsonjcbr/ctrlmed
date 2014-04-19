class Solexame < ActiveRecord::Base
  belongs_to :clilab
  belongs_to :paciente
  has_many :solexameis

  def solexamei_attributes=(solexamei_attributes)
    solexamei_attributes.each do |attributes|
      solexameis.build(attributes)
    end
  end

end
