class Scavvie < ApplicationRecord

    # add software
    def self.get_scavvies_from_spreadsheet(values)

        values.each{|scavvie_row| self.create_by_spreadsheet_values(scavvie_row)}
    end

    def self.create_by_spreadsheet_values(arr)
        keys = ["name", "pronouns", "email", "phone", "location", "skills", "skill_description", "software", "czar_interest", "yearbook_quote", "about"]
        hash = Hash[keys.zip(arr)]
        hash["image_url"] = self.get_an_image
        Scavvie.create(hash.except("skills", "software")) 
    end


    def self.get_an_image
        response = `curl "https://dog.ceo/api/breeds/image/random"`
        JSON.parse(response)["message"]
    end

end
