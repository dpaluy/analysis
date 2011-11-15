class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.integer :analyzer_id, :null => false
      t.decimal :cost, :null => false, :precision => 12, :scale => 5
      t.integer :amount, :default => 0
      t.datetime :timestamp
    end
  end
end
