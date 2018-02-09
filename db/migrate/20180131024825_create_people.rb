class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :f_name
      t.string :l_name
      t.string :username
      t.string :phone_number
      t.string :email
      t.string :gender
      t.date :date_of_birth

      t.timestamps
    end
  end
end
