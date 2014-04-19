class CreateReceitais < ActiveRecord::Migration
  def self.up
    create_table :receitais do |t|
      t.references :receita
      t.references :medicamento
      t.string :qtde
      t.string :dose
      t.timestamps
    end
  end

  def self.down
    drop_table :receitais
  end
end
