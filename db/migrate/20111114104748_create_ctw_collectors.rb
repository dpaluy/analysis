class CreateCtwCollectors < ActiveRecord::Migration
  def change
    create_table :ctw_collectors do |t|    
      t.integer :ctw_id, :null => false
      t.datetime :timestamp
      t.decimal :pr0, :null => false, :precision => 15, :scale => 10
      t.decimal :pr1, :null => false, :precision => 15, :scale => 10
      t.decimal :pr2, :null => false, :precision => 15, :scale => 10
      t.integer :depth     
    end
  end
end
