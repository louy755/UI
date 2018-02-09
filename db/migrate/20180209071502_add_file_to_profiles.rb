class AddFileToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :file, :text
  end
end
