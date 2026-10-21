defmodule Recursion do
  def list_len(list) do
    priv_list_len(0, list)
  end

  defp priv_list_len(accumulator, [head | tail]) do
    new = 1 + accumulator
    priv_list_len(new, tail)
  end

  defp priv_list_len(accumulator, []) do
    accumulator
  end

  def range(from, to) do
    priv_range([], from, to)
  end

  defp priv_range(acc, same, same) do
    Enum.reverse([same | acc])
  end

  defp priv_range(accumulator, from, to) do
    new = [from | accumulator]
    priv_range(new, from + 1, to)
  end

  def positive(list) do
    priv_positive([], list)
  end

  defp priv_positive(acc, [head | tail]) do
    new =
      if head > 0 do
        [head | acc]
      else
        acc
      end

    priv_positive(new, tail)
  end

  defp priv_positive(acc, []) do
    Enum.reverse(acc)
  end
end
