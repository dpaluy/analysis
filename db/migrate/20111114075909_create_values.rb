class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :quote_id, :null => false
      t.decimal :value, :null => false, :precision => 12, :scale => 5
      t.integer :volume, :default => 0
      t.datetime :timestamp
    end
  end
end
