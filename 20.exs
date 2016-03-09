defmodule Factorial do
  def calc(n, acc \\ 1)
  def calc(1, acc) do
    acc
    |> Integer.to_string
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1)))
    |> sum
  end
  def calc(n, acc) do
    calc(n - 1, acc * n)
  end

  def sum(arr, acc \\ 0)
  def sum([], acc), do: IO.puts(acc)
  def sum([head|tail], acc) do
    sum(tail, head + acc)
  end
end
