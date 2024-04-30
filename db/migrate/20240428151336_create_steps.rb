class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :description
      t.datetime :disabled_at
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
