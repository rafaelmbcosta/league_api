class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.references :team, null: false, foreign_key: true
      t.references :round, null: false, foreign_key: true
      t.float :points, null: false, default: 0.0

      t.timestamps
    end
  end
end
