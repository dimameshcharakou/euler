defmodule Problem45 do
  def find(n \\ 286)
  def find(n) do
    x = triangle(n)
    if is_pentagonal?(x) && is_hexagonal?(x) do
      IO.puts(x)
    else
      find(n + 1)
    end
  end

  def is_pentagonal?(n) do
    x = (0.5 + :math.sqrt(0.25 + 6 * n)) / 3
    round(x) == x
  end

  def is_hexagonal?(n) do
    x = (1 + :math.sqrt(1 + 8 * n)) / 4
    round(x) == x
  end

  def triangle(n) do
    n * (n + 1) / 2
  end
end
