defmodule Problem40 do
  @arr [100, 1000, 10000, 100000, 1000000]
  def find(arr \\ @arr, acc \\ 1)
  def find([], acc), do: IO.puts(acc)
  def find([head|tail], acc) do
    a = Enum.to_list(1..300011) |> Enum.join |> String.codepoints
    find(tail, String.to_integer(Enum.at(a, head - 1)) * acc)
  end
end
