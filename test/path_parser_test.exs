defmodule PathParserTest do
  use ExUnit.Case
  doctest Swaggle

  test "We can find the first path" do
    paths = Swaggle.PathParser.get_paths("test/fixtures/petstore-api.yml")
    path = paths |> Enum.fetch!(0)

    assert path == "/api/v1/pets"
  end

  test "It varies by file" do
    paths = Swaggle.PathParser.get_paths("test/fixtures/beers-api.yml")
    path = paths |> Enum.fetch!(0)

    assert path == "/api/v1/beers"
  end

  test "I can think of a third api" do
    paths = Swaggle.PathParser.get_paths("test/fixtures/restaurants-api.yml")
    path = paths |> Enum.fetch!(0)

    assert path == "/api/v1/restaurants"
  end
end
