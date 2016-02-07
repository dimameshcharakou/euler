defmodule Finder do
  def search(n \\ 2, index \\ 0, acc \\ 0)
  def search(_n, 10001, acc), do: IO.puts(acc)
  def search(n, index, _acc) do
    if simple(n) do
      search(n + 1, index + 1, n)
    else
      search(n + 1, index, n)
    end
  end

  def simple(n, i \\ 2)
  def simple(n, i) do
    if i <= :math.sqrt(n) do
      if rem(round(n), i) == 0 do
        false
      else
        simple(n, i + 1)
      end
    else
      true
    end
  end
end
