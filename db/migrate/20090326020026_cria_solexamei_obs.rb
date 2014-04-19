class CriaSolexameiObs < ActiveRecord::Migration
  def self.up
    add_column :solexameis, :obs, :text
  end

  def self.down
    remove_column :solexameis, :obs
  end
end
