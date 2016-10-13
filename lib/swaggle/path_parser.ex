defmodule Swaggle.PathParser do

  def get_paths(file_path) do
    %{"basePath" => base_path, "paths" => paths} = parse_from_file(file_path)

    Enum.map(paths, fn ({key, value}) -> "#{base_path}#{key}" end)
  end

  defp parse_from_file(file_path) do
    full_path(file_path) |> YamlElixir.read_from_file()
  end

  defp full_path(path) do
    File.cwd!
    |> Path.join(path)
  end
end
