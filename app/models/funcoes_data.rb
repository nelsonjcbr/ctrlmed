module FuncoesData

  protected
  
  def inoIdade(dtNascimento=nil, dtHoje=nil)
    unless dtNascimento.nil?
      dataNascimento = dtNascimento.to_date
      if dtHoje.nil?
        dataHoje  = DateTime.now
      else
        dataHoje = dtHoje.to_date
      end
      anos = dataHoje.year - dataNascimento.year
      if dataHoje.month < dataNascimento.month 
        anos -= 1
        meses = dataHoje.month+12 - dataNascimento.month
      else
        meses = dataHoje.month    - dataNascimento.month
      end
      if dataHoje.day < dataNascimento.day
        meses -=1
        if meses < 0
          anos -=1
          meses +=12
        end
      end
      s = anos.to_s + ' ANOS E ' + meses.to_s + ' MESES'
    end
  end
  
end
