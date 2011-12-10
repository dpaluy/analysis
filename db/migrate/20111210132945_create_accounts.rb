class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :stock_amount, :default => 0
      t.decimal :cash, :null => false, :precision => 12, :scale => 5
      t.decimal :total_stock_value, :null => false, :precision => 12, :scale => 5
      t.integer :analyzer_id, :null => false
      t.datetime :timestamp
    end
  end

  def self.down
    drop_table :accounts
  end
end
