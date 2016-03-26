defmodule Problem30 do
  def find(n \\ 2, acc \\ [])
  def find(354294, acc) do
    Enum.sum(acc) |> IO.puts
  end
  def find(n, acc) do
    x = n
        |> Integer.to_string
        |> String.codepoints
        |> Enum.map(&(:math.pow(String.to_integer(&1), 5)))
        |> Enum.sum
    if x == n do
      find(n + 1, [x|acc])
    else
      find(n + 1, acc)
    end
  end
end
