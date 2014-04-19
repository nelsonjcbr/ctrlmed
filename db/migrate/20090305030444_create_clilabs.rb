class CreateClilabs < ActiveRecord::Migration
  def self.up
    create_table :clilabs do |t|
      t.string :nm

      t.timestamps
    end
  end

  def self.down
    drop_table :clilabs
  end
end
