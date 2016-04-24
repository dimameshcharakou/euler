defmodule Problem48 do
  def find(n \\ 1, acc \\ 0)
  def find(1001, acc) do
    acc
    |> Integer.to_string(acc)
    |> String.to_codeponts
    |> Enum.reverse
    |> Enum.slice(0, 10)
  end
  def find(n, acc) do
    find(n + 1, power(n, n) + acc)
  end

  def power(n, x) do
    if x == 0 do
      1
    else
      n * power(n, x - 1)
    end
  end
end
