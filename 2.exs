defmodule Fib do
  def sum(arr \\ [1, 2], n \\ 2, x \\ 1, y \\ 2, acc \\ 2)
  def sum(_arr, n, _x, _y, acc) when n == 10, do: IO.puts(acc)
  def sum(arr, n, x, y, acc) do
    el = x + y
    n = n + 1
    if rem(n, 2) == 0 do
      acc = acc + el
    end
    sum(arr ++ [el], n, y, el, acc)
  end
end
