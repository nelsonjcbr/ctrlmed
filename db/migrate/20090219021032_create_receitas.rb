class CreateReceitas < ActiveRecord::Migration
  def self.up
    create_table :receitas do |t|
      t.date :data
      t.references :paciente

      t.timestamps
    end
  end

  def self.down
    drop_table :receitas
  end
end
