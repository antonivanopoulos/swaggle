defmodule PathParserTest do
  use ExUnit.Case
  doctest Swaggle

  test "parses path from beers file" do
    paths = Swaggle.PathParser.get_paths("test/fixtures/beers-api.yml")

    assert Enum.member?(paths, "/api/v1/beers")
  end

  test "parses path from restaurants file" do
    paths = Swaggle.PathParser.get_paths("test/fixtures/restaurants-api.yml")

    assert Enum.member?(paths, "/api/v1/restaurants")
  end

  test "collects multiple paths" do
    paths = Swaggle.PathParser.get_paths("test/fixtures/pets-api.yml")
    expected_paths = ["/api/v1/pets", "/api/v1/owners", "/api/v1/breeds"]

    Enum.each(paths, fn (path) ->
      assert Enum.member?(expected_paths, path)
    end)
  end
end
