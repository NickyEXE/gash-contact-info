class Scavvie < ApplicationRecord
    has_many :scavvie_skills
    has_many :skills, through: :scavvie_skills


    # add software
    def self.get_scavvies_from_spreadsheet(values)
        values.each{|scavvie_row| self.create_by_spreadsheet_values(scavvie_row)}
    end

    def self.create_by_spreadsheet_values(arr)
        keys = ["name", "pronouns", "email", "phone", "location", "skills", "skill_description", "software", "czar_interest", "yearbook_quote", "about"]
        hash = Hash[keys.zip(arr)]
        hash["image_url"] = self.get_an_image
        scavvie = Scavvie.create(hash.except("skills", "software"))
        scavvie.skills_from_string(hash["skills"])
        scavvie
    end


    def self.get_an_image
        response = `curl "https://dog.ceo/api/breeds/image/random"`
        JSON.parse(response)["message"]
    end

    def skills_from_string(string_of_comma_separated_skills)
        skills_as_array = string_of_comma_separated_skills.split(", ")
        self.skills << Skill.where(name: skills_as_array)
    end
end
