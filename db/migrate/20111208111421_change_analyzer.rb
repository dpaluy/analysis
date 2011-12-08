class ChangeAnalyzer < ActiveRecord::Migration
  def change
    add_column :analyzers, :all_actions, :boolean
    remove_column :analyzers, :quote_id
  end
  
end
