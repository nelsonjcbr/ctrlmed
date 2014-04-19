class CreatePacientes < ActiveRecord::Migration
  def self.up
    create_table :pacientes do |t|
      t.string    :nm_paciente     
      t.date      :dt_nascimento   
      t.string    :estado_civil    
      t.string    :cor             
      t.string    :naturalidade    
      t.string    :endereco        
      t.string    :bairro          
      t.string    :cidade          
      t.string    :uf,    :limit => 2
      t.string    :profissao       
      t.string    :empresa         
      t.string    :fone_empresa    
      t.string    :fone_casa       
      t.string    :celular         
      t.string    :e_mail          
      t.string    :situacao        
      t.string    :encaminhado_por 
      t.date      :dt_prim_consulta
      t.date      :dt_ult_consulta 
      t.string    :antec_pai       
      t.string    :antec_mae       
      t.string    :antec_irmaos    
      t.string    :antec_filhos    
      t.text      :obs1            
      t.text      :obs2            
      t.text      :obs3            
      t.text      :obs4            
      t.text      :obs5            
      t.text      :obs6            
      t.text      :obs7            
      t.text      :obs8            
      t.string    :antec_conjuge   
    end
  end

  def self.down
  end
end
