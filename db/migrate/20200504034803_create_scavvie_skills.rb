class CreateScavvieSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :scavvie_skills do |t|
      t.belongs_to :scavvie, null: false, foreign_key: true
      t.belongs_to :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
