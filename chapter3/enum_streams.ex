defmodule EnumStreams do
  def large_lines!(path) do
    File.stream!(path)
    |> Stream.map(&String.trim_trailing(&1, "\n"))
    |> Enum.filter(&(String.length(&1) > 80))
  end

  def lines_lengths!(path) do
    File.stream!(path)
    |> Enum.map(&String.length/1)
  end

  def longest_line_length!(path) do
    lines_lengths!(path)
    |> Enum.reduce(0, fn element, acc ->
      if element > acc do
        element
      else
        acc
      end
    end)
  end

  def longest_line!(path) do
    result =
      File.stream!(path)
      |> Stream.map(fn x -> {String.length(x), x} end)
      |> Enum.reduce({0, ""}, fn {length, x}, {old_length, y} ->
        if length > old_length do
          {length, x}
        else
          {old_length, y}
        end
      end)

    elem(result, 1)
  end

  def words_per_line!(path) do
    File.stream!(path)
    |> Enum.map(&length(String.split(&1)))
  end
end
