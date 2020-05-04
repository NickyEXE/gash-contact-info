require 'test_helper'

class ScavvieTest < ActiveSupport::TestCase

  test "there is a class named Scavvie" do
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


end
