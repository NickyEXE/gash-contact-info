class CreateScavvies < ActiveRecord::Migration[6.0]
  def change
    create_table :scavvies do |t|
      t.string :name
      t.string :pronouns
      t.string :email
      t.string :phone
      t.string :location
      t.text :skill_description
      t.text :czar_interest
      t.string :yearbook_quote
      t.text :about

      t.timestamps
    end
  end
end
