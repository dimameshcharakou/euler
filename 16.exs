defmodule Calc do
  def power_digit_sum do
    :math.pow(2, 1000)
    |> round
    |> Integer.to_string
    |> String.codepoints
    |> Enum.map(&(String.to_integer(&1)))
    |> sum
  end

  def sum(arr, acc \\ 0)
  def sum([], acc), do: IO.puts(acc)
  def sum([head|tail], acc) do
    sum(tail, head + acc)
  end
end
