class CreateCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinates do |t|
      t.integer :lat
      t.integer :long
      t.belongs_to :sighting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
