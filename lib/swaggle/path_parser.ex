defmodule Swaggle.PathParser do

  def get_paths(%{"basePath" => base_path, "paths" => paths} = response_map) do
    Enum.map(paths, fn ({key, value}) -> "#{base_path}#{key}" end)
  end

  def get_paths(file_path) do
    response_map = map_from_yaml(file_path)

    get_paths(response_map)
  end

  defp map_from_yaml(file_path) do
    full_path(file_path) |> YamlElixir.read_from_file()
  end

  defp full_path(path) do
    File.cwd!
    |> Path.join(path)
  end
end
