class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :year
      t.string :description
      t.belongs_to :artist, foreign_key: true

      t.timestamps
    end
  end
end
