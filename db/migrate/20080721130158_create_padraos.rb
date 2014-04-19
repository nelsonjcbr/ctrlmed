class CreatePadraos < ActiveRecord::Migration
  def self.up
    create_table :padraos do |t|
      t.string    :campo
      t.text      :valores
      t.timestamps
    end
  end

  def self.down
    drop_table :padraos
  end
end
