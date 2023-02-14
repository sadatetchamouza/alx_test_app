class CreateOutputs < ActiveRecord::Migration[6.1]
  def change
    create_table :outputs do |t|
      t.references :prompt
      t.string :url

      t.timestamps
    end
  end
end
