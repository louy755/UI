class RemoveFileFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :file, :string
  end
end
