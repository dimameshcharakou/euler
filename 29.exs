defmodule Problem29 do
  def find(a \\ 2, b \\ 2, acc \\ [])
  def find(a, 101, acc) do
    find(a + 1, 2, acc)
  end
  def find(101, _b, acc) do
    acc |> Enum.uniq |> length |> IO.puts
  end
  def find(a, b, acc) do
    new_value = :math.pow(a, b) |> round
    find(a, b + 1, [new_value|acc])
  end
end
