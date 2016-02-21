defmodule Collatz do
  def calc(n \\ 999_999, acc \\ 0, a \\ 999_999, max \\ 0, el \\ 999_999)
  def calc(1.0, acc, a, max, el) do
    acc = acc + 1
    if acc > max do
      max = acc
      el = a
    end
    calc(a - 1, 0, a - 1, max, el)
  end
  def calc(_n, _acc, 1, max, el), do: IO.puts(el)
  def calc(n, acc, a, max, el) do
    if rem(round(n), 2) == 0 do
      calc(n / 2, acc + 1, a, max, el)
    else
      calc(3 * n + 1, acc + 1, a, max, el)
    end
  end
end
