class Skill < ApplicationRecord
    has_many :scavvie_skills
    has_many :scavvies, through: :scavvie_skills
end
