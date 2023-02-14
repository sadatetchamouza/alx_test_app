class CreateTablePrompts < ActiveRecord::Migration[6.1]
  def change
    create_table :prompts do |t|
      t.text :prompt
      t.integer :number_images
      t.string :size

      t.timestamps
    end
  end
end
