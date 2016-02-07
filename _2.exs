defmodule Fib do
  def sum(x \\ 0, y \\ 1, acc \\ 0)
  def sum(x, y, acc) when x + y >= 4000000, do: IO.puts(acc)
  def sum(x, y, acc) do
    el = x + y
    if rem(el, 2) == 0 do
      acc = acc + el
    end
    sum(y, el, acc)
  end
end
