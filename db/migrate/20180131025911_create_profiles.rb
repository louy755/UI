class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :file
      t.string :picture
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
