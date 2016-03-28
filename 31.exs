defmodule Problem31 do
  def calc(0, _arr), do: 1
  def calc(n, _arr) when n < 0, do: 0
  def calc(_n, []), do: 0
  def calc(n, arr) do
    calc(n, tl(arr)) + calc(n - hd(arr), arr)
  end
end
