require 'test_helper'

class ScavvieTest < ActiveSupport::TestCase

  test "there is a class named Scavvie" do
    # byebug
    puts Scavvie
    assert Scavvie
  end

  test "Scavvie saves when given a correct array on create" do
    arr = [*1..11].map{|num| "test"}
    assert Scavvie.create_by_spreadsheet_values(arr)
  end

  test "Scavvie saves with proper values" do
    arr = [*1..11].map{|num| "test"}
    name = Faker::Name.name
    arr[0] = name
    scavvie = Scavvie.create_by_spreadsheet_values(arr)
    scavvie.name = name
  end

  test "Scavvie has an image associated with them" do
    arr = [*1..11].map{|num| "test"}
    scavvie = Scavvie.create_by_spreadsheet_values(arr)
    assert scavvie.image_url
  end

  test "Scavvie can associate skills from a list of skills" do
    skills = ["Video Editing", "Image Editing", "Puzzles"]
    skills.each{|skill| Skill.create(name: skill)}
    scavvie = Scavvie.create(name: "Nicky", pronouns: "He/Him", email: "dovern42", phone: "666-666-6666", location: "NYC", skill_description: "Very", czar_interest: "Yes", about: "batman", yearbook_quote: "Batman", image_url: "batman.com")
    scavvie.skills_from_string("Video Editing, Image Editing")
    assert scavvie.skills.length === 2
  end


end
