class CreateSolexameis < ActiveRecord::Migration
  def self.up
    create_table :solexameis do |t|
      t.references :solexame
      t.references :exame

      t.timestamps
    end
  end

  def self.down
    drop_table :solexameis
  end
end
