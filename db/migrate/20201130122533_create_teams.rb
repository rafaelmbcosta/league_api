class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.boolean :active, null: false, default: true
      t.string :slug
      t.string :url_escudo_png
      t.string :id_tag
      t.string :player_name

      t.timestamps
    end
  end
end
