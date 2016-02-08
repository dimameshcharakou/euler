defmodule Calc do
  def search(m \\ 2, n \\ 1)
  def search(m, n) do
    a = :math.pow(m, 2) - :math.pow(n, 2)
    b = 2 * m * n
    c = :math.pow(m, 2) + :math.pow(n, 2)
    if (a + b + c) == 1000 do
      IO.puts(a * b * c)
    else
      if m <= (500 / n) do
        search(m + 2, n)
      else
        search(n + 2, n + 1)
      end
    end
  end
end
