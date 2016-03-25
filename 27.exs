defmodule Problem27 do
  def find(b \\ 2, a \\ -999, acc \\ 0, p \\ 0)
  def find(b, 999, acc, p) do
    find(b + 1, -999, acc, p)
  end
  def find(999, _a, _acc, p), do: IO.puts(p)
  def find(b, a, acc, p) do
    if simple(b) do
      x = calculate_primary(b, a)
      if x > acc do
        find(b, a + 1, x, a * b)
      else
        find(b, a + 1, acc, p)
      end
    else
      find(b + 1, -999, acc, p)
    end
  end

  def calculate_primary(b, a, n \\ 0, acc \\ 0)
  def calculate_primary(b, a, n, acc) do
    x = :math.pow(n, 2) + n * a + b
    if x > 0 do
      if simple(x) do
        calculate_primary(b, a, n + 1, acc + 1)
      else
        acc
      end
    else
      acc
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
