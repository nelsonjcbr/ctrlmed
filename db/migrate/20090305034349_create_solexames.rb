class CreateSolexames < ActiveRecord::Migration
  def self.up
    create_table :solexames do |t|
      t.date :data
      t.references :clilab
      t.references :paciente

      t.timestamps
    end
  end

  def self.down
    drop_table :solexames
  end
end
