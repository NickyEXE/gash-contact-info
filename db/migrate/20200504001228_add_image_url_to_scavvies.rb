class AddImageUrlToScavvies < ActiveRecord::Migration[6.0]
  def change
    add_column :scavvies, :image_url, :string
  end
end
