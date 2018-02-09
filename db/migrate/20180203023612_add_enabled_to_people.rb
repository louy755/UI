class AddEnabledToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :enabled, :boolean, default: true
  end
end
