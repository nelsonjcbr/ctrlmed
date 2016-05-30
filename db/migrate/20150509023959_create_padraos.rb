class CreatePadraos < ActiveRecord::Migration
  def change
    create_table :padraos do |t|
      t.string :campo
      t.text :valores

      t.timestamps
    end
  end
end
