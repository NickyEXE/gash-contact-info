class AddSoftwareToScavvies < ActiveRecord::Migration[6.0]
  def change
    add_column :scavvies, :software, :string
  end
end
