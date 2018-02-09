class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :city
      t.string :state
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
