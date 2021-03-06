class CreateDisputes < ActiveRecord::Migration[6.0]
  def change
    create_table :disputes do |t|
      t.string :name, null: false
      t.references :season, null: false, foreign_key: true
      t.boolean :finished, null: false, default: false
      t.integer :order, null: false
      t.integer :active, null: false, default: false
      t.timestamps
    end
  end
end
