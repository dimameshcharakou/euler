defmodule Problem25 do
  def fibbonacchi(n \\ 2, arr \\ [1, 1])
  def fibbonacchi(n, [head|tail]) do
    f = head + hd(tail)
    count = f |> Integer.to_string |> String.length
    if count == 1000 do
      IO.puts(n + 1)
    else
      fibbonacchi(n + 1, [f|[head|tail]])
    end
  end
end
