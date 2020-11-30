class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :number, null: false
      t.boolean :golden, null: false, default: false
      t.references :season, null: false, foreign_key: true
      t.boolean :finished, null: false, default: false
      t.references :dispute, foreign_key: true, null: true
      t.boolean :market_closed, null: false, default: false

      t.timestamps
    end
  end
end
