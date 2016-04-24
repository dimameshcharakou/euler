defmodule Problem44 do
  def find(j \\ 1, k \\ 2)
  def find(j, k) when j == k do
    find(1, k + 1)
  end
  def find(j, k) do
    pj = pentagonal(j)
    pk = pentagonal(k)
    if is_pentagonal?(pk + pj) && is_pentagonal?(pk - pj) do
      IO.puts(pk - pj)
    else
      find(j + 1, k)
    end
  end

  def is_pentagonal?(n) do
    x = (0.5 + :math.sqrt(0.25 + 6 * n)) / 3
    round(x) == x
  end

  def pentagonal(n) do
    n * (3 * n - 1) / 2
  end
end
