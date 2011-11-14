class CreateCtws < ActiveRecord::Migration
  def change
    create_table :ctws do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
