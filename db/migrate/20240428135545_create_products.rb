# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :pos_code
      t.string :description
      t.datetime :disabled_at

      t.timestamps
    end
  end
end
