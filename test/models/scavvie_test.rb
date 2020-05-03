require 'test_helper'

class ScavvieTest < ActiveSupport::TestCase

  test "there is a class named Scavvie" do
    assert Scavvie
  end

  test "Scavvie saves when given a correct hash on create" do
    obj = {name: "test", pronouns: "test", email: "test", phone: "666666666", location: "Chicago", skill_description: "Wow I'm good at swag", czar_interest: "test", yearbook_quote: "test", about: "test"}
    assert Scavvie.create_by_hash(obj)
  end

  test "Scavvie has an image associated with them" do
    obj = {name: "test", pronouns: "test", email: "test", phone: "666666666", location: "Chicago", skill_description: "Wow I'm good at swag", czar_interest: "test", yearbook_quote: "test", about: "test"}
    scavvie = Scavvie.create_by_hash(obj)
    assert scavvie.image_url
  end


end
