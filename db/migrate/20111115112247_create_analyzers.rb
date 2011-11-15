class CreateAnalyzers < ActiveRecord::Migration
  def change
    create_table :analyzers do |t|
      t.string :name, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.integer :quote_id, :null => false
      t.integer :ctw_id, :null => false
      
      t.timestamps
    end
  end
end
