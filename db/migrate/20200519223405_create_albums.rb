class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :band, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :is_live, null: false

      t.timestamps null: false
    end
  end
end
