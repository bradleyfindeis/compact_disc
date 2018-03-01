class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.float :length
      t.belongs_to :album, foreign_key: true

      t.timestamps
    end
  end
end
