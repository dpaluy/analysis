class AddQuoteIdToCtw < ActiveRecord::Migration
  def change
    add_column :ctws, :quote_id, :integer
  end
end
