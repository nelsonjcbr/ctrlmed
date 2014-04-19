class CreateViaaplics < ActiveRecord::Migration
  def self.up
    create_table :viaaplics do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :viaaplics
  end
end
